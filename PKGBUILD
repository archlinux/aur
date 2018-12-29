# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder-git
pkgver=3.10.6.r0.g117c8f94
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
depends=('hicolor-icon-theme' "python-"{cairo,dbus,gobject,mygpoclient,podcastparser})
makedepends=('git' 'help2man' 'intltool')
optdepends=('ffmpeg: transcode audio files to mp3/ogg'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'lame: converting ogg to mp3'
            'libgpod: ipod sync support'
            'mutagen: audio tagging'
            'python-eyed3: mp3 player sync support'
            'python-html5lib: clickable links in GTK UI show notes'
            'webkit2gtk: HTML show notes')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/gpodder/gpodder.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-*}"
    python setup.py build
}

package() {
    cd "${pkgname%-*}"
    PYTHON=python DESTDIR=${pkgdir} make install
}
