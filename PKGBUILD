# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder-git
pkgver=3.10.11.r3.gc6860de1
pkgrel=3
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
depends=(gtk3 python-cairo python-dbus python-gobject python-mygpoclient python-podcastparser)
makedepends=(git help2man intltool)
optdepends=('ffmpeg: transcode audio files to mp3/ogg'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'lame: converting ogg to mp3'
            'libgpod: ipod sync support'
            'mutagen: audio tagging'
            'python-eyed3: mp3 player sync support'
            'python-html5lib: clickable links in GTK UI show notes'
            'webkit2gtk: HTML show notes'
            'youtube-dl: for Youtube-dl extension')
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
    make messages
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir" install
}
