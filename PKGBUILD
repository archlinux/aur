# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: ast261
pkgname=vdr-burn
pkgver=0.3.0
epoch=1
_vdrapi=2.4.0
pkgrel=2
pkgdesc="VDR plugin to create DVDs"
url="https://projects.vdr-developer.org/projects/plg-burn"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gd' 'boost' 'libcdio' 'imlib2' 'dvd+rw-tools' 'dvdauthor' 'mjpegtools' 'lxdvdrip' 'projectx' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/attachments/download/2028/${pkgname}-${pkgver}.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('bfb1847462eea781f98634eb04faab3a')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i 's/ProjectX.jar/projectx\/ProjectX.jar/g' config/vdrburn-dvd.conf
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/${_plugname}-${pkgver}/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

