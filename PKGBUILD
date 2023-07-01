# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-mcli
pkgver=1.0.1
_vdrapi=2.6.3
pkgrel=2
pkgdesc='This is a "plugin" for the Video Disk Recorder (VDR) to access DVB-streams produced by the NetCeiver-hardware.'
url="https://github.com/vdr-projects/vdr-plugin-mcli/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" "libnetceiver" "libnetceiver-tools")
_plugname=${pkgname//vdr-/}
source=("$pkgname-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-mcli/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf"
        "vdr-mcli.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('317cb962980985bf965e1ffdf9c8833c96a619bb5f0ea4fbd2c9c1cb7b3094f7'
            '867cb2c49614281b7055388f8306cdb027915bbd2a7423484f0e56623ecb6bba'
            '65ed34d3b2ab22acba8879caeaf96ebbace0137b0b99f1e77b7993c1b5ed808b')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver//pre/}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver//pre/}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  install -Dm644 "$srcdir/vdr-mcli.conf" "$pkgdir/usr/lib/systemd/system/vdr.service.d/vdr-mcli.conf"
}
