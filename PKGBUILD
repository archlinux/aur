# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrtva
pkgver=0.3.6
_vdrapi=2.4.0
pkgrel=3
pkgdesc="Automatic 'series record' function. Written for UK Freeview"
url="http://projects.vdr-developer.org/projects/vdrtva"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1965/$_plugname-$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('79d08007a2794b970b5d7864c213c980'
         '64e2f9ed3471495641a465e705c85447')

build() {
  cd "${srcdir}/$_plugname-$pkgver"
  mkdir -p po
  make
}

package() {
  cd "${srcdir}/$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
