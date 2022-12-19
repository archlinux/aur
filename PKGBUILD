# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cdplayer
pkgver=1.2.5
_vdrapi=2.6.3
pkgrel=6
pkgdesc="CD-Player plugin which supports CD-Text and CDDB-Database"
url="http://uli-eckhardt.de/vdr/cdplayer.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcdio-paranoia' 'libcddb' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
backup=("var/lib/vdr/plugins/$_plugname/cd.mpg")
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('f4e565d57551790790d491bf573068cfd6ac7bdd1fa527abbb59e84d2744269f'
            'db9505b0b84d281f0268a7ba80e829bb69a2da747c825e15ad0af78b45c883b9')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make CFGDIR=$(pkg-config --variable=resdir vdr)/plugins/$_plugname DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
