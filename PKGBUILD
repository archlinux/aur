# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrboblight
pkgver=0.0.6
_vdrapi=2.2.0
pkgrel=6
pkgdesc="Boblight with data from softhddevice"
url="http://projects.vdr-developer.org/projects/plg-boblight"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boblight' 'gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
replaces=('vdr-boblight')
conflicts=('vdr-boblight')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-boblight-0.0.6.tar.gz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=37154")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('688acb760958646a8a1abe8607eaf2e0')

build() {
  cd "${srcdir}/vdr-plugin-boblight-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-boblight-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
