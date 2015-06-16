# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-ddci2
pkgver=0.0.13
_gitver=381a83d8c7a2d975f0c60bf21105f1f85a1003be
_vdrapi=2.2.0
pkgrel=6
pkgdesc="Support for stand alone CI by Digital Devices for VDR 2.1.6 and higher."
url="https://github.com/jasmin-j/vdr-plugin-ddci2"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/jasmin-j/vdr-plugin-ddci2.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5dc8a287efe1419aaf1162cb6a6f28f3')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git tag -a v0.0.13 -m 'Added Tag' 381a83d8c7a2d975f0c60bf21105f1f85a1003be 2> /dev/null
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
