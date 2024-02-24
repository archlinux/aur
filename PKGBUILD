# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=bikecad
pkgname="${_pkgname}-bin"
pkgver=17.5
pkgrel=1
arch=('x86_64')
pkgdesc="Bicycle design software"
url="https://www.bikecad.ca/"
license=('custom:commercial')
depends=('java-runtime')
makedepends=('libicns')
source=(
  "https://www.bikecad.ca/BikeCADFreeMac${pkgver}.zip"
  'bikecad.desktop'
  'bikecad.sh'
)
sha256sums=('fca4e1422b15e642f05f7c1e4f1beb71931dda4e8dbfb4d1b733843fcb071bc4'
            '5b50d81cc4eac3150eef78f8ed7d6c08e413231280befe606723630c56128297'
            '0840c06b3b065dd8404c2a15a8d1a45e3bf3a4c3c07c7833729174f6c0663a55')

build() {
  icns2png -x -s 512x512 "${srcdir}/BikeCAD Free $pkgver.app/Contents/Resources/bikecadpro.icns"
}

package() {
  cd "$srcdir"
  install -d -m 755 "$pkgdir"/usr/share/java/$_pkgname
  mv "${srcdir}/BikeCAD Free $pkgver.app/Contents/Java/bikeCADPro.jar" \
    "$pkgdir"/usr/share/java/$_pkgname
  install -D -m644 "$srcdir"/bikecad.desktop \
    "$pkgdir"/usr/share/applications/bikecad.desktop
  install -D -m644 "$srcdir"/bikecadpro_512x512x32.png \
    "$pkgdir"/usr/share/pixmaps/bikecad.png
  install -D -m755 "$srcdir"/bikecad.sh \
    "$pkgdir"/usr/bin/bikecad
}

# vim:set ts=2 sw=2 et:
