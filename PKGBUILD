# Maintainer: jjacky
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=pmount
pkgname=$_pkgname-safe-removal
pkgver=0.9.23
pkgrel=7
pkgdesc="mount removable devices as normal user, with safe removal of device"
arch=(i686 x86_64)
license=('GPL2')
url="http://pmount.alioth.debian.org/"
backup=('etc/pmount.allow')
depends=('sysfsutils>=2.0.0-1' 'bash' 'util-linux')
makedepends=('intltool')
provides=('pmount=0.9.23')
conflicts=('pmount')
source=(http://ftp.de.debian.org/debian/pool/main/p/pmount/pmount_0.9.23.orig.tar.bz2
        patch)
md5sums=('db19f5bf3151b1b41705ec7bafa439d3'
         'a1c8ef20e809ab63b7f89d2c68b05620')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../patch
  ./configure --prefix=/usr --disable-hal \
      --with-cryptsetup-prog=/usr/bin/cryptsetup
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm755 "$pkgdir"/media
}
