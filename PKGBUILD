# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-sleeptimer
pkgver=0.8.3
_vdrapi=2.6.3
pkgrel=4
pkgdesc="Shutdown, mute or execute a custom command after a configurable timespan"
url="https://github.com/vdr-projects/vdr-plugin-sleeptimer"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-sleeptimer/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('fb4ef0daea8798fd008f65d8b12201118caadac875303b16722de3c533856921'
            'a71c1272e0ffe6e3c19f29d48ce32d174bfd4d6830c105c1814e521e30c0adec')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
