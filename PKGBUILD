# Maintainer: Yigit Sever <yigit at yigitsever dot com>
_pkgname='turkish-deasciifier'
pkgname='turkish-deasciifier-git'
pkgver=r69.665154c
pkgrel=1
pkgdesc="Turkish deasciifier in Python based on Deniz Yüret's turkish-mode for Emacs"
arch=('any')
url="https://github.com/emres/turkish-deasciifier"
license=('custom')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "debian/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "turkish-deasciify.1" "$pkgdir/usr/share/man/man1/turkish-deasciify.1"
}
