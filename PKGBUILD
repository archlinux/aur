# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrmanager
pkgver=0.15
_gitver=0398f105bcc166d2695f3b8b2f91327c04acca48
_vdrapi=2.4.7
pkgrel=5
pkgdesc="Allows remote programming VDR using VDR-Manager running on Android devices"
url="http://projects.vdr-developer.org/projects/vdr-manager"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'openssl' 'zlib' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://projects.vdr-developer.org/git/vdr-manager.git#commit=${_gitver}"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '71313516d4f88aeee23f76dc3c82dca9')

build() {
  cd "${srcdir}/vdr-manager/${pkgname}"
  make
}

package() {
  cd "${srcdir}/vdr-manager/${pkgname}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
