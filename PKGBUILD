# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=vapoursynth-editor-git
pkgver=R19.mod.5.beta2.0.gb71e2c8
pkgrel=1
pkgdesc="A simple program for edit/create VapourSynth scripts. (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=170965'
license=('CCPL'
         'MIT'
         'LGPL'
         )
depends=('qt6-5compat'
         'qt6-websockets'
         'vapoursynth'
         )
makedepends=('git'
             'qt6-base'
             )
provides=('vapoursynth-editor')
conflicts=('vapoursynth-editor')
source=('vapoursynth-editor::git+https://github.com/YomikoR/VapourSynth-Editor.git'
        'vsedit.desktop'
        'vsedit_server_watch.desktop'
        )
sha256sums=('SKIP'
            '7c73f873a970bb295be8fdcf8ef570ef9bb812232b3cc2dce79b42c57c742623'
            'bc6443a2dfa48ee1e2156039be2195074dfd4a02f5f1696f8406c715a1b19ccf'
            )
options=('debug')

pkgver() {
  cd vapoursynth-editor
  echo "$(git describe --long --tags | tr - . | tr r R)"
}

build() {
  cd vapoursynth-editor/pro
  qmake6

  make
}

package() {
  install -Dm644 vsedit.desktop "${pkgdir}/usr/share/applications/vsedit.desktop"
  install -Dm644 vsedit_server_watch.desktop "${pkgdir}/usr/share/applications/vsedit_server_watch.desktop"

  cd "vapoursynth-editor/build/release-64bit-gcc"
  install -Dm755 vsedit "${pkgdir}/usr/bin/vsedit"
  install -Dm755 vsedit-job-server "${pkgdir}/usr/bin/vsedit-job-server"
  install -Dm755 vsedit-job-server-watcher "${pkgdir}/usr/bin/vsedit-job-server-watcher"
  install -Dm644 vsedit.svg "${pkgdir}/usr/share/pixmaps/vsedit.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/vsedit/README"
}
