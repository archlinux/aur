# Maintainer: jansalleine <jan.wassermann@jansalleine.com>

pkgname=gt2fork-git
pkgver=v0.6b
pkgrel=2
pkgdesc='An experimental overhaul of GoatTracker 2.7x - originally by L. Öörni aka Cadaver / Covert Bitops.'
arch=('x86_64')
url='https://github.com/jansalleine/gt2fork'
license=('GPL-2.0-only')
depends=(
    'sdl2-compat'
    'alsa-lib'
    'jack'
)
makedepends=(
    'gcc-libs'
    'git'
    'sdl12-compat'
)
source=("git+https://github.com/jansalleine/gt2fork.git")
sha512sums=('SKIP')

build() {
    cd gt2fork/src
    make clean
    make
}

package() {
    APPPATH="$pkgdir/usr/share/applications"
    ICONPATH="$pkgdir/usr/share/icons"
    INSTALLPATH="$pkgdir/usr/bin"

    install -vDm755 -t "$pkgdir/usr/bin" "gt2fork/linux/gt2fork"
    install -vDm644 -t "$pkgdir/usr/share/icons" "gt2fork/src/res/gt2fork.png"

    mkdir -p $APPPATH

    touch "$APPPATH/gt2fork.desktop"
    echo "[Desktop Entry]" >> "$APPPATH/gt2fork.desktop"
    echo "Version=1.0" >> "$APPPATH/gt2fork.desktop"
    echo "Type=Application" >> "$APPPATH/gt2fork.desktop"
    echo "Exec=/usr/bin/gt2fork %f" >> "$APPPATH/gt2fork.desktop"
    echo "Terminal=false" >> "$APPPATH/gt2fork.desktop"
    echo "Icon=/usr/share/icons/gt2fork.png" >> "$APPPATH/gt2fork.desktop"
    echo "Name=gt2fork" >> "$APPPATH/gt2fork.desktop"
    echo "Comment=C64 SID music tracker" >> "$APPPATH/gt2fork.desktop"
    echo "Categories=AudioVideo;AudioVideoEditing;Audio;" >> "$APPPATH/gt2fork.desktop"
    echo "MimeType=audio/x-mod;audio/sng;" >> "$APPPATH/gt2fork.desktop"
    echo "StartupNotify=false" >> "$APPPATH/gt2fork.desktop"
    chmod 644 "$APPPATH/gt2fork.desktop"
}
