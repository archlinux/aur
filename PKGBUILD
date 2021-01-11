# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

name=squirrel-battle
pkgname=python-squirrel-battle-git
pkgver=23.14
pkgrel=1
pkgdesc="Watch out for squirrel's knives!"
arch=('any')
url="https://gitlab.crans.org/ynerant/squirrel-battle"
license=('GPLv3')
depends=('python')
makedepends=('gettext' 'python-setuptools')
depends=('noto-fonts-emoji')
checkdepends=('python-tox')
source=("git+https://gitlab.crans.org/ynerant/squirrel-battle.git")
sha256sums=("SKIP")

pkgver() {
  cd $name
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $name
  python setup.py build
}

check() {
  cd $name
  tox -e py3
  tox -e linters
}

package() {
  cd $name
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
