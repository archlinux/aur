# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: crov
pkgname=vdr-chanman
pkgver=0.0.10
_vdrapi=2.4.0
pkgrel=20
pkgdesc="Change channel with a multi level choice"
url="http://projects.vdr-developer.org/projects/plg-chanman"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
#install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1004/vdr-plugin-$_plugname-$pkgver.tar.gz"
        "$pkgname-Makefile::http://projects.vdr-developer.org/git/vdr-plugin-chanman.git/plain/chanman/Makefile")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('ad5928dd686377e98b6de13017e8aaab'
         '55c42f218df5a456bb4570083ec414ef')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  cp "$srcdir/$pkgname-Makefile" Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
