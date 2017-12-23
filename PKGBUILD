# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=onscripter
pkgver=20170814
pkgrel=1
pkgdesc="A game engine compatible to NScripter, to create and perform visual novel games"
arch=('i686' 'x86_64')
url="http://onscripter.sourceforge.jp/onscripter.html"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'lua51' 'fontconfig')
source=("http://onscripter.sourceforge.jp/${pkgname}-${pkgver}.tar.gz"
        'avifile.patch')

sha256sums=('07010e633e490f24f4c5a57dd8c7979f519d0a10a2bfbba8e04828753f1ba97a'
            '871831f04857ac7eafb3a52ab9ea648669f893ac2087f04d14e08e7f78829446')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i ${srcdir}/avifile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -f Makefile.Linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 onscripter "${pkgdir}/usr/bin/onscripter"
}
