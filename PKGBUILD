# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrtva
pkgver=0.3.5
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Automatic 'series record' function. Written for UK Freeview"
url="http://projects.vdr-developer.org/projects/vdrtva"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdrtva.git/snapshot/$_plugname-$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('0810a954f6b93c4163f8e8b63dd227d4'
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
