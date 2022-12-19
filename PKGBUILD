# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cecremote
pkgver=1.5.0
_vdrapi=2.6.3
pkgrel=7
pkgdesc="Receive and send commands via CEC"
url="https://uli-eckhardt.de/vdr/cec.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcec' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('406f3cda3f26483d49be015f9ff5ae2430898f7db38bc1aec90eff06fe3c5cd1'
            '3d7655bec063ff0dbedb54802b3323a2eb36c92c2a17f551cbb09f7296d42229')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
