# Maintainer: Gigadoc2 <gigadoc2+aur@revreso.de>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# Contributor: G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

_pkgname=sooperlooper
pkgname=${_pkgname}-git
pkgver=r510.f00442b
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording. Build from git with open merge requests."
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL')
depends=('jack' 'liblo' 'libsigc++' 'libxml2' 'rubberband' 'wxgtk')
optdepends=('libsamplerate: audio sample rate conversion')
provides=('sooperlooper')
conflicts=('sooperlooper')
source=("git+https://github.com/essej/sooperlooper.git"
        "${_pkgname}.desktop"
        "slgui.png")
sha256sums=('SKIP'
            'add385c13329e0d28b4d89d1a08953d09013a896c80bbda7fe450de4bd279507'
            '465dfb14154899eae5435afa7b2e04b2cbb8463fc3b60c465246628e496b3d85')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  CPPFLAGS=-std=c++11 ./configure \
          --prefix=/usr \
          --with-wxconfig-path=/usr/bin/wx-config
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 ../slgui.png "${pkgdir}/usr/share/pixmaps/slgui.png"
}
