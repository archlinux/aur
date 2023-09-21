# Maintainer:
# Contributor: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: Andrei "Garoth" Thorp <garoth "at the nice" gmail "dot" com>

_pkgname=debhelper
pkgname="$_pkgname"
pkgver=13.11.5
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
