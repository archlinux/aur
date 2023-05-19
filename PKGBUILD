# Maintainer: Matthew Spangler <mattspangler@protonmail.com>
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=mhash-pkg-config
_srcname=mhash
pkgver=0.9.9.9
pkgrel=1
pkgdesc="A fork of the community repo's mhash package with a pkg-config file included."
arch=('x86_64')
url="http://mhash.sourceforge.net/"
license=('LGPL')
depends=('glibc')
conficts=('mhash')
source=("https://downloads.sourceforge.net/sourceforge/mhash/${_srcname}-${pkgver}.tar.bz2"
        "mhash.pc")
sha512sums=('3b063d258cb0e7c2fa21ed30abae97bd6f3630ecd1cb4698afb826aa747555f3cf884828f24ac5e2b203730d0c7c0ecc9ef1e724ad9d85769a2f66128f3072eb'
            'd98888f54ee33faefaa9abdd830c70a7a87f518cb0125a1b7d87ed0731300e0cf67cd21993f9ff070010c1ebe9efad41431f6e18233d170cae82142d03c8c4f7')

build() {
  cd ${_srcname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_srcname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 $srcdir/mhash.pc $pkgdir/usr/lib/pkgconfig/mhash.pc
}

