# Maintainer: Klaus Alexander Seistrup
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname='slang'
_pkgver='2.3.4-5'
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('x86_64' 'armv7h' 'aarch64')
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
md5sums=('f4913d9b0f686fa00dfb0b165f30e900')

build() {
  cd "${_pkgname}-${_prever}" || exit 1

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "${_pkgname}-${_prever}" || exit 1

  test "$CARCH" = 'i686' || make check
}

package() {
  cd "${_pkgname}-${_prever}" || exit 1

  make DESTDIR="${pkgdir}" install-all
}

# Calculated
sha256sums=(
  'f82d8ec4baa47dbf16e7e3b7b23ccc8ff9f426886b63f3fb1b97aa9d6c2b76f7'
)
sha512sums=(
  '7c2ab5f3f4736c9671b715122be0fb39675ffc742902366f0b2261c11e28005ca9cb4c1eb966f310f085022be9632ee2c53aa56ef7c628c2f47578a8c2c7e9f2'
)
b2sums=(
  '6105c2fa7ef1c9b20d78896e0b03f9676bb63b932ac3630a0c2f6879b3fd0d96f1289084fefd69e84c977c1b48494e5f8fbe928b76198bb3e057921a39bfb4e5'
)

# eof
