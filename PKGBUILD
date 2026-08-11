# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Peter at PBlackman plus com

_pkgname=GrimRipper
pkgname="${_pkgname,,}"
pkgver=3.0.2
pkgrel=1
pkgdesc="Graphical audio CD ripper and encoder (based on Asunder)"
arch=('x86_64')
url="https://gitlab.gnome.org/Salamandar/${_pkgname}"
license=('GPL-2.0-only')
depends=('cdparanoia'
         'gtk3'
         'hicolor-icon-theme'
         'libcddb')
makedepends=('gettext'
             'meson')
optdepends=('fdkaac: for mp3 support'
            'flac: for flac support'
            'lame: for mp3 support'
            'mac: for monkey audio support'
            'musepack-tools: for musepack support'
            'opus-tools: for opus support'
            'vorbis-tools: for ogg support'
            'wavpack: for wavpack support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha512sums=('693a6f9ebb3b4b751b23c23b04bb9e3885c3d9054b9b664a1b9776ab38bd60f7bb088b5cba5047556c3feb4edc80a29ee9f2fc1139f26df6cbd6c51de65bf667')

prepare() {
  mv "${_pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  meson setup --prefix=/usr build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  ninja
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install  
}
