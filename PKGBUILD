# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=vidify
pkgver=2.2.0
pkgrel=1
pkgdesc="Watch music videos in real-time for the songs playing on your device"
arch=("any")
url="https://github.com/vidify/vidify"
license=("LGPL")
depends=("python" "glib2" "python-gobject" "gtk3" "youtube-dl" "python-vlc"
         "python-lyricwikia" "python-pydbus" "python-tekore"
         "python-qdarkstyle" "python-appdirs" "python-pyqt5"
         "python-pyqtwebengine" "python-qtpy" "python-zeroconf")
optdepends=("python-mpv: support for the mpv player"
            "vidify-audiosync: audio synchronization extension")
makedepends=("python-setuptools")
source=("https://github.com/vidify/vidify/archive/v$pkgver.tar.gz")
md5sums=('a32df7bf83a87c91b6219b64ed4ffc51')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # Installing the desktop file and icon
    install -Dm755 "dev/vidify.desktop" "$pkgdir/usr/share/applications/vidify.desktop"
    install -Dm644 "dev/vidify.svg" "$pkgdir/usr/share/pixmaps/vidify.svg"
}
