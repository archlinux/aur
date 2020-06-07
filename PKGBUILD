# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime-music'
pkgver='0.10.2'
pkgrel=2
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+.'
url='https://gitlab.com/sumner/sublime-music'
depends=(
    'python'
    'libnm-glib'
    'libnotify'
    'python-bottle'
    'python-dataclasses-json'
    'python-dateutil'
    'python-deepdiff'
    'python-deprecated'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-levenshtein'
    'python-mpv'
    'python-pychromecast'
    'python-requests'
    'python-yaml'
)
optdepends=(
    'python-keyring: support for storing passwords in the system keyring'
)
makedepends=(
    'python-setuptools'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime-music-0.10.2.tar.gz'
    'https://gitlab.com/sumner/sublime-music/-/archive/v0.10.2/sublime-music-v0.10.2.tar.gz'
)
md5sums=('30ea7977b4c903cec43e3ae284d03a21'
         '5791a91b58572131ee1e5a3c118806bc')


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
