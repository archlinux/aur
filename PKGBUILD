_pkgname=debhelper
pkgname="${_pkgname}-git"
pkgver=13.11.4.r7.gdab61554
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="https://salsa.debian.org/debian/debhelper.git/"
_url_dh_strip_nondeterminism="https://salsa.debian.org/reproducible-builds/strip-nondeterminism"
license=('GPL2' 'GPL3')
depends=(
  'binutils'
  'dpkg'
  'file'
  'html2text'
  'man-db'
  'perl'
  'perl-pod-parser'
  'strip-nondeterminism'

  # AUR
  'po-debconf'
)
makedepends=(
  'file'
  'git'
  'po4a'
)
optdepends=(
  'dh-make: convert source archives into Debian package source'
)

provides=('dh-strip-nondeterminism')
conflicts=('dh-strip-nondeterminism')

source=(
  "${pkgname}"::"git+https://salsa.debian.org/debian//debhelper.git"
  dh_strip_nondeterminism::"${_url_dh_strip_nondeterminism}/-/raw/master/bin/dh_strip_nondeterminism?inline=false"
)
md5sums=(
  'SKIP'
  'SKIP'
)

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

  install -Dm755 "${srcdir}/dh_strip_nondeterminism" -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
