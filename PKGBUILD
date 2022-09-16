_pkgname=debhelper
pkgname="${_pkgname}-git"
pkgver=13.9.1.r1.g7667548a
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="https://salsa.debian.org/debian/debhelper.git/"
license=('GPL2' 'GPL3')
depends=(
  'binutils'
  'dpkg>=1.16.2'
  'file>=3.23'
  'html2text'
  'man-db>=2.5.1'
  'perl>=5.6.0'
  'perl-pod-parser'
  'po-debconf'
)
makedepends=(
  'file>=3.23'
  'git'
  'man-db>=2.5.1'
  'po4a>=0.24'
)
optdepends=('dh-make')
source=("${pkgname}"::"git+https://salsa.debian.org/debian//debhelper.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
