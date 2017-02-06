# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=citro3d
pkgver=1.2.0
pkgrel=1
pkgdesc="Library providing a stateful interface to the PICA200 GPU of the Nintendo 3DS (CTR) for homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('libctru')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/citro3d-src-$pkgver.tar.bz2"
        "https://raw.githubusercontent.com/fincs/citro3d/bb959f46124df6510344e35ea88222ea73a2cf64/README.md")
sha256sums=('e6daf2d8f424b368b72447bb32db153b55d4fb446eb07a439622977c5340bfe9'
            'c180f070d33cab29607728dd5b689be90ff1604afeef3207655e1287791174f9')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make install

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed '/# License/,$!d' README.md > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
