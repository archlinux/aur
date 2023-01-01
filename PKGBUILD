# Maintainer: Klaus Alexander Seistrup
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver='2.3.4-7'
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
md5sums=('21e4c33194a26d8fb2304afea107e88b')

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
  '7c773efa3c258ed916de152c3c29fe360cefca7ffaea1e6fd8f386085f096872'
)
sha512sums=(
  'aaa75ba4b3849a5438cc179ab88df29f539f9b332d26df75c80ac6a7e6bf79c49754ace82207e10fc981558d2f1348d479bb7266999dd18d05071d65e7d9a8ff'
)
b2sums=(
  '48d228f9c6ed848b1c7210c89f626fa60a0bb80168fa78fee2682ead0bda5aa47e8871d27c75987aa8a9db68f4640cbcd75b6375145a0ee09280752f36454f7d'
)

# eof
