# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-lcdproc
pkgver=1.0.0
_vdrapi=5
pkgrel=5
pkgdesc="Output to LCD modules that are supported by LCDproc"
url='https://github.com/vdr-projects/vdr-plugin-lcdproc'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('lcdproc: to use local displays')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-lcdproc/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf"
        '92-lcdproc.rules')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('faaf721d3a9fa91a5e819ac7c2d0146aac66eae0aca5ab5c6dfc283abaecbd31'
            '07f8880fb87e4dc43b630f1f0ed0d28b4595bb1adcd758ba85677b78a9ab6df6'
            '2870d2edf64ea965ec48edefca0fc534ee05abb3202e703f8fcf23e9b3da9522')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-lcdproc.rules" "$pkgdir/usr/lib/udev/rules.d/92-lcdproc.rules"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
