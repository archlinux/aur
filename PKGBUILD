# Maintainer: Philipp Koppenstein philipp@koppenstein.com

_pkgname='mangl'
pkgname="${_pkgname}-git"
pkgver=1.0.r3.g845acd7
pkgrel=2
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'freeglut' 'libgl' 'glu')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/zigalenarcic/mangl.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_pkgname}/mandoc"
  ./configure --prefix=/usr --exec_prefix=/usr
  make -C ..
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
