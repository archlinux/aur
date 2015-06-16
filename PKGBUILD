# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-plex
pkgver=0.1.4
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Plex plugin for Linux VDR"
url="https://github.com/chriszero/vdr-plugin-plex"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('poco' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-$_plugname.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('23fffc2a4a6d33eb7e89673ee4db56b8'
         '6cae9281ef39d6c64569580fbffefe11')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  sed -i '/^VERSION :=/d' Makefile
  make GIT_REV=''
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
