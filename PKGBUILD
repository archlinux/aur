# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrmanager
pkgver=0.14
_vdrapi=2.2.0
pkgrel=2
pkgdesc="Allows remote programming VDR using VDR-Manager running on Android devices"
url="http://projects.vdr-developer.org/projects/vdr-manager"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('openssl' 'zlib' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1971/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('a84bddc7cde5164b626cd9aaf9e62f2d'
         '71313516d4f88aeee23f76dc3c82dca9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
