# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=saturn
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform, all-in-one machinima studio for Super Mario 64."
arch=('x86_64')
depends=('sdl2' 'glew')
source=('https://github.com/Llennpie/Saturn/archive/legacy.tar.gz')
sha256sums=('a9ac36d73fa5142a6da5d94974dcaada2e7b206d2752e531369a4d5555f5dc85')

build() {
    cd "$srcdir/Saturn-legacy"
    make -j$(nproc)
}

package() {
    INSTALL_PATH=$HOME/.local/share/v64saturn
    DESKTOP_ENTRY=$HOME/.local/share/applications/saturn.desktop
    mkdir -p  $INSTALL_PATH/res
    cp "$srcdir/Saturn-legacy/build/us_pc/saturn.us.f3dex2e" $INSTALL_PATH
    cp "$srcdir/Saturn-legacy/build/us_pc/libdiscord_game_sdk.so" $INSTALL_PATH
    cp "$srcdir/Saturn-legacy/res/saturn-linuxicon.png" $INSTALL_PATH/res
    cp -r "$srcdir/Saturn-legacy/dynos" $INSTALL_PATH
    cp -r "$srcdir/Saturn-legacy/fonts" $INSTALL_PATH
    echo "[Desktop Entry]" >> $DESKTOP_ENTRY
    echo "Name=Saturn" >> $DESKTOP_ENTRY
    echo "Comment=A cross-platform, all-in-one machinima studio for Super Mario 64." >> $DESKTOP_ENTRY
    echo "Exec=$INSTALL_PATH/saturn" >> $DESKTOP_ENTRY
    echo "Path=$INSTALL_PATH" >> $DESKTOP_ENTRY
    echo "Icon=$INSTALL_PATH/res/saturn-linuxicon.png" >> $DESKTOP_ENTRY
    echo "Terminal=false" >> $DESKTOP_ENTRY
    echo "Categories=Game" >> $DESKTOP_ENTRY
}
