# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-satip
pkgver=2.2.3
_vdrapi=2.2.0
pkgrel=3
pkgdesc="Integrates SAT>IP network devices seamlessly into VDR"
url="http://www.saunalahti.fi/rahrenbe/vdr/satip/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/satip/files/$pkgname-$pkgver.tgz"
        'https://github.com/rofafor/vdr-plugin-satip/commit/e46340f5f37b907a6dd6f45f9bd929d8e60b06d5.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
md5sums=('e3ce734e15c544f2adc57b651702d48e'
         '2181f66a5d9d2aa2d50db72bcdef099f'
         '1b86395f44c2a7c63b97a7ef6f866ec0')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/e46340f5f37b907a6dd6f45f9bd929d8e60b06d5.diff"
}


build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make GITTAG=''
}


package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
