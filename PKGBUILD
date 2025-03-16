# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-satip
pkgver=2.4.1.r3.g02a842f
_gitver=02a842f95a09a74d7eba90648c97693638007141
_vdrapi=6
pkgrel=6
pkgdesc="Integrates SAT>IP network devices seamlessly into VDR"
url="https://github.com/rofafor/vdr-plugin-satip"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'pugixml' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/rofafor/vdr-plugin-${_plugname}.git#commit=${_gitver}"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('SKIP'
            'fce92c838c53ac84cb750942d2b016d2de2032f03b837ad68f773c36373305e1')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
