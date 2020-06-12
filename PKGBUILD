# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor:  VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.4
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'wxgtk2')
makedepends=('alsa-lib' 'jack' 'liblo' 'libsamplerate' 'libsndfile' 'libxml2'
'ncurses' 'rubberband')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/essej/${pkgname}/archive/v${pkgver//./_}.tar.gz"
        "${pkgname}.desktop"
        "slgui.png")
sha256sums=('69646705f48c3fe3c3371f3aba7052c67c5797bd3e2837e89cd998cb524cf23f'
            'add385c13329e0d28b4d89d1a08953d09013a896c80bbda7fe450de4bd279507'
            '465dfb14154899eae5435afa7b2e04b2cbb8463fc3b60c465246628e496b3d85')

prepare() {
  mv -v "${pkgname}-${pkgver//./_}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so' 'libncursesw.so'
  'librubberband.so' 'libsamplerate.so' 'libsndfile.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 ../${pkgname}.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 ../slgui.png -t "${pkgdir}/usr/share/pixmaps/"
}
