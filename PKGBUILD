# Maintainer: Michael Serajnik <ms dot mserajnik dot at>
pkgname=10ff-git
_pkgname=10ff
pkgver=r35.fea0a73
pkgrel=1
pkgdesc="Typing tests in CLI"
arch=('any')
url="https://github.com/rr-/${_pkgname}"
license=('WTFPL')
depends=('python')
source=("git+https://github.com/rr-/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root=$pkgdir

  install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
