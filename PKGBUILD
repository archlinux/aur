# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime-music'
pkgver='0.9.2'
pkgrel=1
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+.'
url='https://gitlab.com/sumner/sublime-music'
depends=(
    'python'
    'python-bottle'
    'python-deepdiff'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-levenshtein'
    'python-mpv'
    'python-pychromecast'
    'python-requests'
    'python-yaml'
    'libnm-glib'
    'libnotify'
)
optdepends=(
    'python-keyring: support for storing passwords in the system keyring'
)
makedepends=(
    'python-setuptools'
    'inkscape'
    'make'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime-music-0.9.2.tar.gz'
    'https://gitlab.com/sumner/sublime-music/-/archive/v0.9.2/sublime-music-v0.9.2.tar.gz'
)
md5sums=('119080e814e1cc0ed0ba521f65bf50fd'
         '9a82279c510cc74eeb61d91ef03d6143')


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
