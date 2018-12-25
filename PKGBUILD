# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-zappilot
pkgver=0.0.5
_vdrapi=2.4.0
pkgrel=17
pkgdesc="Plugin for VDR forked from the plugin pilotskin to browse EPG in channel info"
url="http://projects.vdr-developer.org/projects/plg-zappilot"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1318/$pkgname-$pkgver.tgz"
        "zappilot-0.0.5-vdr-2.3.1-porting.diff")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('0774d4093fc6158dc321e52b336aa2ab'
         '6acf67f7e5f84d2965ba6826f91124f3')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -p1 -i "$srcdir/zappilot-0.0.5-vdr-2.3.1-porting.diff"
}

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
