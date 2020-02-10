# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
#
_pkgname="lastfm-desktop"
pkgname="lastfm"
pkgver="2.1.39"
pkgrel="2"
pkgdesc="The official Last.fm desktop application suite"
url="http://www.last.fm/"
arch=('any')
license=('GPL3')
conflicts=('lastfm-git' 'lastfm-mpd-cli' 'lastfm-msk' 'lastfm-msk-light')
provides=("${pkgname}")
depends=('qt4>4.8' 'ruby' 'liblastfm' 'pkg-config' 'fftw' 'taglib'\
         'libsamplerate' 'libmad' 'libgpod' 'sqlite' 'phonon-qt4'\
         'phonon-qt4-vlc' 'ffmpeg' 'qtwebkit'
)
source=("Last.fm-$pkgver.tar.zip::https://github.com/lastfm/${_pkgname}/archive/$pkgver.zip"
        'lastfm-scrobbler'
)
sha256sums=('ef7949e6b827f29311e3c4e54b537accfff0f408119817f38b7e62899cda4256'
            '882523081fadfd5c52315229414324aab61affeb9d4213543b6ac051c84b4476')


build() {
    qmake-qt4 -r
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/opt/last.fm/css
    mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
    cp -R _bin ${pkgdir}/opt/last.fm/bin
    cp ./app/client/Last.fm\ Scrobbler.css ${pkgdir}/opt/last.fm/css/
    install -m755 ${srcdir}/lastfm-scrobbler ${pkgdir}/usr/bin/
    install -D -m644 ${srcdir}/lastfm-scrobbler.desktop ${pkgdir}/usr/share/applications/
    install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/app/client/audioscrobbler.ico ${pkgdir}/usr/share/pixmaps/
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
