# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.3
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL')
depends=('jack' 'liblo' 'libsigcpp1.2' 'libxml2' 'rubberband' 'wxgtk2.8')
optdepends=('libsamplerate: audio sample rate conversion')
install="${pkgname}.install"
source=("${url}${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "slgui.png")
sha256sums=('7a7dbdedb5dab28fb1f98ba5827d88df4c7327909ab87f6def167517786f4f58'
            'add385c13329e0d28b4d89d1a08953d09013a896c80bbda7fe450de4bd279507'
            '465dfb14154899eae5435afa7b2e04b2cbb8463fc3b60c465246628e496b3d85')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --with-wxconfig-path=/usr/bin/wx-config-2.8
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../slgui.png "${pkgdir}/usr/share/pixmaps/slgui.png"
}
