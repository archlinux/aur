# Maintainer: Klaus Alexander Seistrup
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname='slang'
_pkgver='2.3.4-6'
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
provides=('slang')
conflicts=('slang')
url='https://jedsoft.org/snapshots/'
license=('GPL')
depends=(
  'libpng'
  'oniguruma'
  'pcre'
)
backup=('etc/slsh.rc')
options=('lto' '!makeflags')
source=("${url}slang-$_prever.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('7cc28752c6b6adf69b3ac8ee05849045')

build() {
  cd "${_pkgname}-${_prever}" || exit 1

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "${_pkgname}-${_prever}" || exit 1

  test "$CARCH" != 'i686' && make check
}

package() {
  cd "${_pkgname}-${_prever}" || exit 1

  make DESTDIR="${pkgdir}" install-all
}

# Calculated
sha256sums=(
  '4be0a4f6f19d4e3c1ad2ac8912e78336865ea09c31fc16e6dacf637eb2b1c713'
)
sha512sums=(
  '1049b85d9957a436861546fb8db24907e65700d6b59790b9f2e215d24664a771838bc89dd79d6954d415b35c8f765f709ff9a01c1a17c55aa29d9835bd33dfa0'
)
b2sums=(
  'd1a96d9314d699e025c9076e78b094fdbbea834c13944c64d5b5c1c12b3d4b2b0aea51d15cf72a3d773686c454e5263345df8509dcc6fb741563c042d59ed117'
)

# eof
