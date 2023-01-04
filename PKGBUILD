# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

pkgname=debhelper
pkgver=13.11.4
pkgrel=1
pkgdesc="A collection of programs that can be used in a debian/rules file to automate common tasks"
arch=('any')
url="https://salsa.debian.org/debian/debhelper.git/"
_url_dh_strip_nondeterminism="https://salsa.debian.org/reproducible-builds/strip-nondeterminism"
license=('GPL2' 'GPL3')
depends=(
  'binutils'
  'dpkg>=1.16.2'
  'file>=3.23'
  'html2text'
  'man-db>=2.5.1'
  'perl-pod-parser'
  'perl>=5.6.0'
  'po-debconf'
  'strip-nondeterminism'
)
makedepends=(
  'file>=3.23'
  'git'
  'man-db>=2.5.1'
  'po4a>=0.24'
)
optdepends=(
  'dh-make: convert source archives into Debian package source'
)

provides=('dh-strip-nondeterminism')
conflicts=('dh-strip-nondeterminism')

source=(
  "git+https://salsa.debian.org/debian//debhelper.git#tag=debian/$pkgver"
  dh_strip_nondeterminism::"${_url_dh_strip_nondeterminism}/-/raw/master/bin/dh_strip_nondeterminism?inline=false"
  )
md5sums=(
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm755 "${srcdir}/dh_strip_nondeterminism" -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
