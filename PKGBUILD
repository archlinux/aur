# Maintainer: Philippe Schenker <dev@pschenker.ch>

name=ixxat-socketcan
pkgname="${name}-dkms"
pkgver=2.0.520
pkgrel=2
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=("i686" "x86_64")
url="https://www.hms-networks.com/support/general-downloads"
license=("GPL2")
optdepends=("can-utils: Linux-CAN / SocketCAN user space applications")
depends=("dkms")
source=("https://hmsnetworks.blob.core.windows.net/nlw/docs/default-source/products/ixxat/monitored/pc-interface-cards/socketcan-linux.gz?sfvrsn=3eb48d7_89&download=true"
        "dkms.conf")
sha256sums=("dd34dfb4e1c988693c2b6799c467ba7689758c9757fa8e8e4890fa7715b818b6"
            "1a7f4502869171cc1dc617e670f018309af1a7bd0a352108002c75a55bb3016c")

prepare() {
  cd "$srcdir"
  sed "s/@PKGVER@/${pkgver}/" -i dkms.conf
  sed "s/@PKGNAME@/${name}/" -i dkms.conf
  tar xzfv "ix_usb_can_2.0.520-REL.tgz"
}

package() {
  dkmsdir="${pkgdir}/usr/src/${name}-${pkgver}/"
  install -d "${dkmsdir}"
  cp "$srcdir/dkms.conf" "$dkmsdir"
  tar -xvzf "ix_usb_can_2.0.520-REL.tgz" -C "$dkmsdir"
}
