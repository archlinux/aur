# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime-music'
pkgver='0.9.0'
pkgrel=1
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+.'
url='https://gitlab.com/sumner/sublime-music'
depends=(
    'python'
    'python-bottle'
    'python-dateutil'
    'python-deepdiff'
    'python-deprecated'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-keyring'
    'python-levenshtein'
    'python-mpv'
    'python-pychromecast'
    'python-requests'
    'python-yaml'
    'libnm-glib'
    'libnotify'
)
makedepends=(
    'python-setuptools'
    'inkscape'
    'make'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime-music-0.9.0.tar.gz'
    'https://gitlab.com/sumner/sublime-music/-/jobs/artifacts/v0.9.0/download?job=build_logo'
)
md5sums=('89353db351a27d22da9feab9db2f21cf'
         '1aeb80106186a8acac6616b97fc99016')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd ${srcdir}

    pushd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd

    desktop-file-install --dir=${pkgdir}/usr/share/applications sublime-music.desktop

    pushd docs/logo/build
    install -Dm644 16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/sublime-music.png
    install -Dm644 22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/sublime-music.png
    install -Dm644 32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/sublime-music.png
    install -Dm644 36x36.png ${pkgdir}/usr/share/icons/hicolor/36x36/apps/sublime-music.png
    install -Dm644 48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/sublime-music.png
    install -Dm644 64x64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/sublime-music.png
    install -Dm644 72x72.png ${pkgdir}/usr/share/icons/hicolor/72x72/apps/sublime-music.png
    install -Dm644 96x96.png ${pkgdir}/usr/share/icons/hicolor/96x96/apps/sublime-music.png
    install -Dm644 128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/sublime-music.png
    install -Dm644 192x192.png ${pkgdir}/usr/share/icons/hicolor/192x192/apps/sublime-music.png
    install -Dm644 512x512.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/sublime-music.png
    install -Dm644 1024x1024.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/sublime-music.png
    popd

    popd
}
