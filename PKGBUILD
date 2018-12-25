# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-satip
pkgver=2.4.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Integrates SAT>IP network devices seamlessly into VDR"
url="http://www.saunalahti.fi/rahrenbe/vdr/satip/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/satip/files/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
md5sums=('2fec4e80db37e5d8f35aca825053ed20'
         '1b86395f44c2a7c63b97a7ef6f866ec0')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
