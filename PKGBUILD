# Maintainer: Klaus Alexander Seistrup
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver='2.3.4-8'
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
  'glibc'
  'libpng'
  'oniguruma'
  'pcre'
  'zlib'
)
backup=('etc/slsh.rc')
options=('lto' '!makeflags')
source=("${url}slang-$_prever.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('c740ca7ded82fa29849046ca33c572b1')

build() {
  cd "${_pkgname}-${_prever}" || exit 1

  case "$CLAGS" in
    *-ffat-lto-objects* ) : pass ;;
    * ) export CFLAGS="$CFLAGS -ffat-lto-objects" ;;
  esac

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
  'bd2de566dba919a0cc230b970236c89b095d693cc15344e28f7f9d4e646b9a6b'
)
sha512sums=(
  'bca104861f947b8a7a318c0cf4128be236eea603f0ca73125d7609d6ff4a7a425d99388e6df64f2d5b1f92a1e32bddb655dcaaa85acd397507559cdf11daf98b'
)

# eof
