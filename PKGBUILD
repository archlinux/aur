# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime-music'
pkgver='0.11.2'
pkgrel=1
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+.'
url='https://sublimemusic.app'
depends=(
    'python'
    'python-dataclasses-json'
    'python-dateutil'
    'python-deepdiff'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-levenshtein'
    'python-mpv'
    'python-peewee'
    'python-requests'
    'python-semver'
)
optdepends=(
    'libnm-glib: for changing the Subsonic server address depending on what SSID you are connected to'
    'libnotify: for system song notification support'
    'python-keyring: support for storing passwords in the system keyring'
    'python-pychromecast: support for casting to Chromecast devices'
    'python-bottle: support for casting downloaded files to Chromecasts on the same LAN'
)
makedepends=(
    'python-setuptools'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime-music-0.11.2.tar.gz'
    'https://gitlab.com/sumner/sublime-music/-/archive/v0.11.2/sublime-music-v0.11.2.tar.gz'
)
md5sums=('2c2c435c609fce7cd4d2e6e3c08a5a28'
         'adc2a16e3e02d06d8292304e3a60cb81')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd ${srcdir}

    pushd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd

    pushd "${_module}-v${pkgver}"

    desktop-file-install --dir=${pkgdir}/usr/share/applications sublime-music.desktop

    pushd logo/rendered
    install -Dm644 16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/sublime-music.png
    install -Dm644 22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/sublime-music.png
    install -Dm644 32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/sublime-music.png
    install -Dm644 36.png ${pkgdir}/usr/share/icons/hicolor/36x36/apps/sublime-music.png
    install -Dm644 48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/sublime-music.png
    install -Dm644 64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/sublime-music.png
    install -Dm644 72.png ${pkgdir}/usr/share/icons/hicolor/72x72/apps/sublime-music.png
    install -Dm644 96.png ${pkgdir}/usr/share/icons/hicolor/96x96/apps/sublime-music.png
    install -Dm644 128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/sublime-music.png
    install -Dm644 192.png ${pkgdir}/usr/share/icons/hicolor/192x192/apps/sublime-music.png
    install -Dm644 512.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/sublime-music.png
    install -Dm644 1024.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/sublime-music.png
    popd

    popd  # pkg

    popd  # srcdir
}
