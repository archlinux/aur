# Maintainer: dreieck

pkgname=xmms-mplayer
_pkgver=0.5
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="An input plugin for xmms that allows to playback media files using mplayer as backend."
arch=('i686' 'x86_64')
url="http://xmmsmplayer.sourceforge.net/"
license=(
         'GPL'
        )
depends=(
         'glib'
         'gtk'
         'xmms'
         'mplayer'
        )
makedepends=(
             'glib'
             'gtk'
             'xmms'
            )
optdepends=(
           )
install=""
source=(
        "http://sourceforge.net/projects/xmmsmplayer/files/xmmsmplayer/${_pkgver}/xmmsmplayer-${_pkgver}.tar.gz"
       )
sha256sums=(
            "538b124121ce9a61f7a4c1dee3a57c9aa279fe1752ad597d311e5a91d208a1c4"
           )

prepare() {
  true
}

build() {
  cd "${srcdir}/xmmsmplayer-${_pkgver}"
  
  _config_opts=(
                --prefix="/usr"
                --sysconfdir="/etc"
                --infodir="/usr/share/info"
                --mandir="/usr/share/man"
               )
  
  ./configure "${_config_opts}"
  make
}

package() {
  cd "${srcdir}/xmmsmplayer-${_pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D -m664 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
