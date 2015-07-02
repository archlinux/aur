# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=wobbly-git
pkgver=r4.2.g8f9b54d
pkgrel=1
pkgdesc="IVTC assistant for VapourSynth, similar to Yatta. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/dubhater/Wobbly'
license=('GPL')
depends=('qt5-base' 'vapoursynth-plugin-fieldhint-git' 'vapoursynth-plugin-d2vsource-git')
makedepends=('git')
provides=('wobbly')
conflicts=('wobbly')
source=('wobbly::git+https://github.com/dubhater/Wobbly.git'
        'wobbly.desktop')
sha1sums=('SKIP'
          '0fda5064306cf489879fa5234c8baf40879bb805')
install=wobbly-git.install

pkgver() {
  cd wobbly
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd wobbly
  ./autogen.sh
}

build() {
  cd wobbly
  ./configure --prefix=/usr
  make --trace
}

package() {
  make -C wobbly DESTDIR="${pkgdir}" install

  install -Dm644 wobbly.desktop "${pkgdir}/usr/share/applications/wobbly.desktop"
}
