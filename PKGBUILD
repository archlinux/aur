# Maintainer: honjow
pkgname=moonlight-qt-axi
_pkgname=moonlight-qt
pkgver=6.1.0
pkgrel=4
pkgdesc='GameStream client for PCs'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://github.com/Axixi2233/moonlight-qt'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'ffmpeg' 'sdl2_ttf' 'sdl2-compat')
makedepends=('vulkan-headers')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs GMA 4500 (2008) up to Coffee Lake (2017)'
            'intel-media-driver: hardware acceleration for Intel GPUs starting from Broadwell (2014) and newer (e.g. Intel Arc)'
            'qt6-wayland')
_tag="18c9f089fdb020dadea6694ca6b7d242deb4320d"
source=("git+https://github.com/Axixi2233/moonlight-qt.git#tag=${_tag}")
sha512sums=('30379f5eba1b51083a0a16de1fbe0cb25379d62a56a7504a96fa3d17a9a0c4a1d44ea64d935f342f548575d7110c09677d1eec510f984925951bbdb3e57a3a94')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  qmake6 PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  cd "${srcdir}/${_pkgname}"
  make release
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
}
