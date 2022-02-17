# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrtva
pkgver=0.3.7
_vdrapi=2.6.1
pkgrel=3
pkgdesc="Automatic 'series record' function. Written for UK Freeview"
url="https://projects.vdr-developer.org/git/vdrtva.git"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/git/vdrtva.git/snapshot/vdrtva-$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('c96456935053640c6dce9e34093e6ab678291c643485477fb888495a550a9fbf'
            'c9d53920822753461d997a7190992c867af4f523d7c64ec2f528f7fce783840f')

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
