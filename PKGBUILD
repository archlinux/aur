# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=openscad-libraries
pkgver=20131231
pkgrel=1
pkgdesc="For now just Write.scad, please request additions."
arch=('any')
url="http://www.thingiverse.com/thing:16193"
license=('unknown')
depends=('openscad')
source=('WriteScad.zip::http://thingiverse.com/download:54849')
noextract=('WriteScad.zip')
md5sums=('77801032662e321df4d2ae808fcaef06')

build() {
  cd "$srcdir"

  mkdir -p write
  pushd write
  bsdtar -xf ../WriteScad.zip
  sed -i 's|write.scad|write/&|' Test*.scad
  popd

}

package() {
  cd "$srcdir"

  pushd write
  install -Dm644 Write.scad  "$pkgdir/usr/share/openscad/libraries/write/write.scad"
  cp *.{dxf,svg} "$pkgdir/usr/share/openscad/libraries/write/"
  install -d "$pkgdir/usr/share/openscad/examples/"
  cp Test*.scad "$pkgdir/usr/share/openscad/examples/"
  install -Dm644 WriteScadDoc.pdf "$pkgdir/usr/share/openscad/docs/WriteScadDoc.pdf"
  popd
}

# vim:set ts=2 sw=2 et:
