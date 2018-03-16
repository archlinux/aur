# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.16
pkgrel=1
pkgdesc='P(ortable|ackageable) NaCl-based crypto library'
arch=('x86_64')
url='https://github.com/jedisct1/libsodium'
license=('custom:ISC')
depends=('lib32-glibc' 'libsodium')
source=("https://download.libsodium.org/libsodium/releases/libsodium-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('54A2B8892CC3D6A597B92B6C210627AABA709FE1') # Frank Denis
sha256sums=('eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533'
            'SKIP')

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
