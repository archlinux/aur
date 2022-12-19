# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrmanager
pkgver=0.15
_vdrapi=2.6.3
pkgrel=9
pkgdesc="Allows remote programming VDR using VDR-Manager running on Android devices"
url="https://github.com/vdr-projects/vdr-plugin-vdrmanager"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'openssl' 'zlib' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-vdrmanager/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('d7ea657788abff6cc3908791b8b6e1757446765e89ec9e684e2b131f5bda7d55'
            'b3e0228b523da61555ab1410a0b94291a5a1982c426f643ee6e1a2141e34863b')

build() {
  cd "${srcdir}/vdr-plugin-vdrmanager-$pkgver/${pkgname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-vdrmanager-$pkgver/${pkgname}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
