# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=wobbly-git
pkgver=v4.17.ga7b0ef1
pkgrel=1
pkgdesc="IVTC assistant for VapourSynth, similar to Yatta. (GIT version)"
arch=('x86_64')
url='https://github.com/dubhater/Wobbly'
license=('GPL')
depends=('qt5-base'
         'vapoursynth-plugin-scxvid-git'
         'vapoursynth-plugin-fieldhint-git'
         'vapoursynth-plugin-d2vsource-git'
         'vapoursynth-plugin-lsmashsource'
         'xdg-utils'
         )
makedepends=('git')
provides=('wobbly')
conflicts=('wobbly')
source=('wobbly::git+https://github.com/dubhater/Wobbly.git'
        'wobbly.desktop'
        'wibbly.desktop'
        )
sha256sums=('SKIP'
            '8dcaf8a1bf264573ecba9499af04183648b6a585b6ff495a158ebb58bfcb4e32'
            '0b69cf647f00c1e8378c2aa45297cc08dd08af77702a4ea429290086c17729ec'
            )

pkgver() {
  cd wobbly
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd wobbly
  ./autogen.sh

  cd "${srcdir}/build"
  ../wobbly/configure \
    --prefix=/usr

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 wobbly.desktop "${pkgdir}/usr/share/applications/wobbly.desktop"
  install -Dm644 wibbly.desktop "${pkgdir}/usr/share/applications/wibbly.desktop"
}
