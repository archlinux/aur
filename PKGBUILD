# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-music
pkgver=1.1.20150413165956
_srcdirname=deepin-music-player-1.1+20150413165956~fa225d345b
pkgrel=1
pkgdesc='Awesome music player with brilliant and tweakful UI Deepin-UI based.'
arch=('any')
url="https://gitcafe.com/Deepin/deepin-music"
license=('GPL3')
depends=('python2')
makedepends=('deepin-gettext-tools')
groups=('deepin-extra')
provides=('deepin-music-player')
replaces=('deepin-music-player')
conflicts=('deepin-music-player')
install="${pkgname}.install"
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-music-player/deepin-music-player_1.1+20150413165956~fa225d345b.tar.gz")
sha256sums=('ff74ed6d7e574ce3fded5523429eafe172bb92f18acba1ef817960cd8c86b777')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  deepin-generate-mo tools/locale_config.ini
}

package() {
  depends=('gstreamer0.10-python' 'gstreamer0.10-bad-plugins'
           'gstreamer0.10-good-plugins' 'gstreamer0.10-ugly-plugins'
           'mutagen' 'python2-chardet' 'python2-pyquery' 'python2-cssselect'
           'python2-dbus' 'sonata' 'cddb-py' 'python2-scipy' 'python2-pycurl'
           'python2-xlib' 'python2-keybinder2' 'python2-deepin-music-player' 'desktop-file-utils')

  cd "${_srcdirname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
