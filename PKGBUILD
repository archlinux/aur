# Maintainer: Christopher Wells <cwellsny@nycap.rr.com>
pkgname=jekyll-helper-git
pkgrel=1
pkgver=0
pkgdesc="A GUI for the static website generator Jekyll."
arch=('any')
url="https://excaliburzero.github.io/jekyll-helper/"
license=('MIT')
depends=("python2" "dconf")
makedepends=("git" "python2-distutils-extra")
provides=("jekyll-helper")
conflicts=("jekyll-helper")
install="jekyll-helper.install"
source=("git://github.com/ExcaliburZero/jekyll-helper.git")
md5sums=("SKIP")

_gitname="jekyll-helper"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"

  python2 setup.py build
}

package() {
  cd "$_gitname"

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # Install the LICENSE file
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
