# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Corey Richardson <corey@octayn.net>

pkgname=asciidocfx
pkgver=1.5.5
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX 8"
arch=('any')

url="http://asciidocfx.com/"
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment-openjdk=8')
depends=('java-environment=8' 'java-openjfx>=8.u76')

source=("https://github.com/asciidocfx/AsciidocFX/archive/v$pkgver.tar.gz"
        'asciidocfx')
sha512sums=(
'26d6e0255d47327fa6323f09abddfd0e237d75a1339672ec907c36bb2c2305a8a963d218da10a4b38e1aaf740188ad97c5142c7dcf6524c0e9aae90692c46717'
'338ee0d004724d5eef8cd44fe7f6d89bb4d48b37143240d4d65258ab4c571f9e931821d9bf52a64c87b6e83165bb9c571541bc4142c73485bcdcc105de0f1ea7'
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
