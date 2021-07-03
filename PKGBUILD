# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=vapoursynth-editor-sandsmark-git
pkgver=r19.74.g4e3f161
pkgrel=1
pkgdesc="Editor for VapourSynth scripts, sandsmark's fork with vim support and other niceties"
arch=('x86_64')
url='https://github.com/sandsmark/vapoursynth-editor'
license=('CCPL' 'MIT' 'LGPL')
depends=('qt5-base'
         'qt5-websockets'
         'vapoursynth'
         )
makedepends=('git' 'cmake')
provides=('vapoursynth-editor')
conflicts=('vapoursynth-editor')
source=('git+https://github.com/sandsmark/vapoursynth-editor.git'
        'vsedit.desktop'
        'vsedit_server_watch.desktop'
        )
sha256sums=('SKIP'
            '7c73f873a970bb295be8fdcf8ef570ef9bb812232b3cc2dce79b42c57c742623'
            'bc6443a2dfa48ee1e2156039be2195074dfd4a02f5f1696f8406c715a1b19ccf'
            )

pkgver() {
  cd vapoursynth-editor
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build && cd build
  cmake ../vapoursynth-editor
}

build() {
  cd build
  make
}

package() {
  install -Dm644 vsedit.desktop "${pkgdir}/usr/share/applications/vsedit.desktop"

  cd build
  install -Dm755 vsedit "${pkgdir}/usr/bin/vsedit"

  cd ../vapoursynth-editor
  install -Dm644 resources/vsedit.svg "${pkgdir}/usr/share/pixmaps/vsedit.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vsedit/README"
}
