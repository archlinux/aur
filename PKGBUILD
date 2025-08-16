# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvscraper
pkgver=1.2.14
pkgrel=1
_vdrapi=9
pkgdesc="Runs in the background and collects metadata for all available EPG events"
url="https://github.com/MarkusEh/vdr-plugin-tvscraper"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
depends=('curl' 'jansson' 'libxml2' 'sqlite' "vdr-api=${_vdrapi}")
replaces=('vdr-tvscrapper')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkusEh/vdr-plugin-tvscraper/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/tvscraper/override.conf')
sha256sums=('a3411bb9886fc25f6fd385e6e6a5c25076465fccdb39a5c85cf16e70f1e0d790'
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
