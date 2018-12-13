# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Mikeserv

pkgname=bcache-tools
pkgver=1.0.8
pkgrel=2
pkgdesc="Userspace tools for bcache until bcache merges with either dm or md"
changelog=bcache-tools.changelog
arch=('i686' 'x86_64')
url="http://bcache.evilpiepirate.org/"
license=('GPL')
depends=('util-linux')
install="${pkgname}.install"
source=("https://github.com/g2p/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'crc64.patch'
        'initcpio-arch.patch')
sha256sums=('d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c'
            '2536e1ea76b32b4ee4543524c64f488ccc0fe037256ce9d5c5029e873161de7e'
            '70c14ef1b5fd41f6a34afc888c5e478bd7bea296b49643f59714c518c6e4f831')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/initcpio-arch.patch"
  patch -Np1 -i "${srcdir}/crc64.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/udev/rules.d" \
    "${pkgdir}/usr/share/man/man8" \
    "${pkgdir}/usr/lib/initcpio/install"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
