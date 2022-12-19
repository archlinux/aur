# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-undelete
pkgver=2.3.1_pre1
_vdrapi=2.6.3
pkgrel=9
pkgdesc="allows to undelete accidentally deleted VDR recordings"
url="http://phivdr.dyndns.org/vdr/vdr-undelete/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
# The dyndns.org address seems to link to some private server behind a DSL
# connection which is down sometimes. To compensate for that, we use an
# archive.org URL which is more reliable.
#source=("http://phivdr.dyndns.org/vdr/$pkgname/$pkgname-${pkgver/_/-}.tgz"
source=("https://web.archive.org/web/20200503085352/http://phivdr.dyndns.org/vdr/vdr-undelete/vdr-undelete-2.3.1-pre1.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('c29afb201c0cafe3f2904b5bf9c1d41b'
         'd37975ef3acb4bcf41c74e56606ad0c1')

build() {
  cd "${srcdir}/${_plugname}-${pkgver/_/-}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
