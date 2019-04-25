# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nxengine-evo
pkgver=2.6.4
pkgrel=1
pkgdesc="A somewhat upgraded/refactored version of nxengine"
arch=('i686' 'x86_64')
url="https://github.com/isage/nxengine-evo"
license=('GPL3')
depends=(sdl2_mixer libpng)
makedepends=(cmake sdl2_ttf)
source=("https://github.com/isage/nxengine-evo/archive/v${pkgver}.tar.gz"
        "https://www.cavestory.org/downloads/cavestoryen.zip")
sha256sums=('482bb96ae0a778e17856a041237a5c53b581c0ed0e3b7da8bff9e70d283939f6'
            'aa87fa30bee9b4980640c7e104791354e0f1f6411ee0d45a70af70046aa0685f')

build() {
  cd "$pkgname-$pkgver"

  #Compile
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  cd ..

  #Extract content
  cp -r data/ ../CaveStory/
  chmod +x bin/extract
  cd ../CaveStory
  ../"$pkgname-$pkgver"/bin/extract
}

package() {
  mkdir -p "$pkgdir"/usr/share
  cp -r CaveStory/ "$pkgdir"/usr/share/nxengine
  install -Dm755 "$pkgname-$pkgver"/bin/nx "$pkgdir"/usr/bin/nx-evo
}
