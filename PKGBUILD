# Maintainer: Corey Richardson <corey@octayn.net>
pkgname=asciidocfx
pkgver=1.5.0
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX 8"
arch=('any')
url="http://asciidocfx.com/"
license=('Apache')
depends=('java-environment=8' 'java-openjfx>=8.u76')
makedepends=('maven>=3.3.9' 'java-environment-openjdk=8')
source=("https://github.com/asciidocfx/AsciidocFX/archive/v$pkgver.tar.gz"
        'asciidocfx')
noextract=()
sha256sums=(
'8e31e7f8ca9fb40045273557089dd3580097bc99fea8904b6d471d12865f8c0e'
'a7b4491ff8d379519c5085b9779c613695c2be941f3473422d69cefbdb9d3d95'
)

build() {
  cd "AsciidocFX-$pkgver"

  # "install" seemingly means "build and ready for installation"
  mvn clean install
}

package() {
  cd "AsciidocFX-$pkgver"

  install -dm755 "$pkgdir/usr/share/java/asciidocfx"
  install -dm755 "$pkgdir/usr/bin"
  mv -t "$pkgdir/usr/share/java/asciidocfx" target/appassembler/{conf,lib}
  install -m775 ../asciidocfx "$pkgdir/usr/bin/asciidocfx"
}
