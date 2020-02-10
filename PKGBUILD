# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=vidify
pkgver=2.0.1
pkgrel=1
pkgdesc="Watch live music videos for the songs playing on your device"
arch=("any")
url="https://github.com/vidify/vidify"
license=("LGPL")
depends=("python" "glib2" "python-gobject" "gtk3" "youtube-dl" "python-vlc"
         "python-lyricwikia" "python-pydbus" "python-tekore"
         "python-qdarkstyle" "python-appdirs" "python-pyqt5"
         "python-pyqtwebengine" "python-qtpy")
optdepends=("python-mpv: support for the mpv player")
optdepends=("vidify-audiosync: audio synchronization extension")
makedepends=("python-setuptools")
source=("https://github.com/vidify/vidify/archive/$pkgver.tar.gz")
md5sums=('92ab3ba7aeda722de2ab508365b6c4f6')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # Installing the desktop file and icon
    install -Dm755 "dev/vidify.desktop" "$pkgdir/usr/share/applications/vidify.desktop"
    install -Dm644 "vidify/gui/res/icon.svg" "$pkgdir/usr/share/pixmaps/vidify.svg"
}
