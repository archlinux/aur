# vapoursynth-winesupport
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile.desu@gmail.com>

pkgname=vapoursynth-winesupport
pkgver=R45.1
pkgrel=1
pkgdesc='A video processing framework with the future in mind'
arch=('x86_64')
url='https://github.com/swordfeng/vapoursynth'
license=('LGPL2.1' 'custom:OFL')
depends=('gcc-libs' 'glibc' 'libmagick' 'python' 'tesseract' 'wine'
         'libass.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libzimg.so')
makedepends=('cython' 'python-sphinx' 'nasm' 'git' 'cmake')
provides=('vapoursynth')
conflicts=('vapoursynth')
source=("vapoursynth-${pkgver}::git+https://github.com/swordfeng/vapoursynth.git#tag=${pkgver}-wine"
        'vapoursynth.xml')
sha256sums=('SKIP'
            '8e51579547d20cd7cb9618a47b3ac508423d09d76649bf038d0ab9acb850b068')

build() {
  cd vapoursynth-${pkgver}

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd vapoursynth-${pkgver}

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/lib{64,}

  install -Dm 644 ofl.txt -t "${pkgdir}"/usr/share/licenses/vapoursynth/
  install -Dm 644 ../vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}

