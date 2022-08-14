# Maintainer: Klaus Alexander Seistrup
# -*- mode: sh -*-

pkgname=slang-snapshot
_pkgname=slang
pkgver=2.3.3
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('x86_64' 'armv7h')
provides=('slang')
conflicts=('slang')
url='https://jedsoft.org/snapshots/'
license=('GPL')
depends=('pcre')
backup=('etc/slsh.rc')
options=('!makeflags')
source=("${url}slang-$pkgver.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('4d6049513ae780ea6e288a46c3dc4d15')

build() {
  cd "${_pkgname}-${pkgver}" || exit 1

  export CFLAGS="$CFLAGS -flto=auto"

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

check() {
  cd "${_pkgname}-${pkgver}" || exit 1

  test "$CARCH" = 'i686' || make check
}

package() {
  cd "${_pkgname}-${pkgver}" || exit 1

  make DESTDIR="${pkgdir}" install-all
}

# Calculated
sha256sums=(
  '3d091652ccb27026034093ba261de94492337e9ae69ed4e37f5a3ca22c74ccc2'
)
sha512sums=(
  '97cd6c704f9a7bc4e4f062443c56e51b2b26f4943fdc8bf54c86d427df608f4bcb8d5f7b2c6d26fa417c7a9905850fd9ad4ed84b91a8e8499446348ffa398d74'
)
b2sums=(
  'e8a2adc2f8bd81a8d5137e1a8e25a99110b56fb89db12afe8a2133b54ea0cec07a747cf04744f99f7e34d0e1ad278696b71f84e373c23c6f2c7fdf6dda0869a8'
)

# eof
