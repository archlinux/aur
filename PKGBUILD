# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvscraper
pkgver=1.0.2
_vdrapi=2.6.3
pkgrel=2
pkgdesc="Runs in the background and collects metadata for all available EPG events"
url="https://github.com/MarkusEh/vdr-plugin-tvscraper"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'jansson' 'libxml2' 'sqlite' "vdr-api=${_vdrapi}")
replaces=('vdr-tvscrapper')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkusEh/vdr-plugin-tvscraper/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/tvscraper/override.conf')
sha256sums=('c378870518575365a7790b3f7084b7b86f12e13ecb62446238b9eab491e96739'
            '8e3d62505e7c17364a482374bc9f90cdabe6ef81bf4104f87c3898cb5397d808')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
