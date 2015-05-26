# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=vapoursynth-editor-git
pkgver=r4.2.g8f9b54d
pkgrel=1
pkgdesc="A simple program for edit/create VapourSynth scripts. (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?p=1688477"
license=('CCPL' 'MIT' 'LGPL')
depends=('qt5-base' 'vapoursynth' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git')
provides=('vapoursynth-editor')
conflicts=('vapoursynth-editor')
install=vapoursynth-editor-git.install
source=('git+https://bitbucket.org/mystery_keeper/vapoursynth-editor.git'
        'vsedit.desktop')
sha1sums=('SKIP'
          '33df6813bdcceb3e11a094576515812f9df7eff6')

pkgver() {
  cd vapoursynth-editor
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd vapoursynth-editor/pro
  qmake-qt5
  make
}

package() {
  install -Dm644 ../vsedit.desktop "${pkgdir}/usr/share/applications/vsedit.desktop"

  [ "${CARCH}" = "i686" ] && _arch=32
  [ "${CARCH}" = "x86_64" ] && _arch=64

  cd "vapoursynth-editor/build/release-${_arch}bit-gcc"
  install -Dm755 vsedit "${pkgdir}/usr/bin/vsedit"
  install -Dm644 vsedit.svg "${pkgdir}/usr/share/pixmaps/vsedit.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/vsedit/README"
}
