# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dummydevice
pkgver=2.0.0
_vdrapi=2.6.3
pkgrel=21
pkgdesc="Output device that does nothing"
url="http://phivdr.dyndns.org/vdr/vdr-dummydevice/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://phivdr.dyndns.org/vdr/vdr-dummydevice/vdr-dummydevice-$pkgver.tgz"
        "$pkgname-00-devicename.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('5c0049824415bd463d3abc728a3136ee064b60a37b5d3a1986cf282b0d757085'
            'b23737ce41bbe7ee0fab5b77bdd8bbc34a372410ad8bcea0ee256987a99e256d')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  patch -p1 -i "$srcdir/$pkgname-00-devicename.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
