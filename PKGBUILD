# Contributor: Baytars <feicuihuangfeng@qq.com>
pkgname=garlic-player-git
pkgver=0.3.0
pkgrel=1
pkgdesc="SMIL Player for Digital Signage"
arch=('x86_64')
url="https://garlic-player.com"
_git=https://github.com/sagiadinos/garlic-player.git
_commit=d0b97d7043c4231d8e67e4b62b04d00653cf0b5b
license=('AGPL3')
depends=('vlc' 'gcc')
makedepends=('make' 'qt5-base' 'git')
provides=('garlic-player')
conflicts=('garlic-player')
install=garlic-player.install
source=(git+$_git 'garlic-player.desktop')
sha256sums=('SKIP'
            'a595aff43accef379a2e3f92209a7db4230917a8a071453003494a5ba9b7b02c')

build() {
  cd ${srcdir}/garlic-player
  git checkout $_commit

  rm -rf build
  mkdir build
  cd build

  qmake ../src/complete.pro
  make -j20
}

package() {
  install -D -m755 ${srcdir}/garlic-player/build/bin/garlic-player ${pkgdir}/usr/bin/garlic-player
  install -d ${pkgdir}/usr/share/garlic-player
  install -D -m644 ${srcdir}/garlic-player/deployment/deb/garlic-player/usr/share/pixmaps/garlic-player.png ${pkgdir}/usr/share/pixmaps/garlic-player.png
  install -D -m644 ${startdir}/garlic-player.desktop ${pkgdir}/usr/share/applications/garlic-player.desktop

  rm -rf ${srcdir}/garlic-player/build
}
