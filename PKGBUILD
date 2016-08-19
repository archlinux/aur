# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.11
pkgrel=1
pkgdesc='P(ortable|ackageable) NaCl-based crypto library'
arch=('x86_64')
url='https://github.com/jedisct1/libsodium'
license=('custom:ISC')
depends=('lib32-glibc' 'libsodium')
source=("http://download.libsodium.org/libsodium/releases/libsodium-${pkgver}.tar.gz")
sha256sums=('a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765')

build() {
  cd libsodium-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd libsodium-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libsodium "${pkgdir}"/usr/share/licenses/lib32-libsodium
}

# vim:set ts=2 sw=2 et:
