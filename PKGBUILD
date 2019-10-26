# Maintainer: Philipp Koppenstein philipp@koppenstein.com

_pkgname='mangl'
pkgname="${_pkgname}-git"
pkgver=20191022.13e891b
pkgrel=1
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
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$srcdir/${_pkgname}"
  cd mandoc
  ./configure --prefix=/usr --exec_prefix=/usr
  cd "$srcdir/${_pkgname}"
  make
}

check() {
	true
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
