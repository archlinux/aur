# Maintainer: Erik Bjäreholt <erik@bjareho.lt>
# Maintainer: Johan Bjäreholt <johan@bjareho.lt>

# PRs welcome at: https://github.com/ActivityWatch/aur-activitywatch-bin

pkgname=activitywatch-bin
pkgver='0.9.0'
pkgrel=1
epoch=
pkgdesc="Log what you do on your computer. Simple, extensible, no third parties."
arch=('x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
provides=("activitywatch")
conflicts=("activitywatch")
depends=(
    #'qt5-base'
    #'qt5-svg'
    #'gtk3'
    #'openssl-1.0'
)
source=("https://github.com/ActivityWatch/activitywatch/releases/download/v${pkgver}/activitywatch-v${pkgver}-linux-x86_64.zip")
md5sums=('SKIP')

package() {
    # Install into /opt/activitywatch
    mkdir -p $pkgdir/opt
    cp -r activitywatch $pkgdir/opt

    # Symlink executables to /usr/bin
    mkdir -p $pkgdir/usr/bin
    execnames=("aw-qt")
    for name in "${execnames[@]}"; do
        ln -s /opt/activitywatch/$name $pkgdir/usr/bin/$name
    done

    modulenames=("aw-server" "aw-watcher-afk" "aw-watcher-window")
    for name in "${modulenames[@]}"; do
        ln -s /opt/activitywatch/$name/$name $pkgdir/usr/bin/$name
    done

    # Add .desktop file for autostart
    mkdir -p $pkgdir/etc/xdg/autostart
    cp activitywatch/aw-qt.desktop $pkgdir/etc/xdg/autostart

    # These takes a lot of space, getting rid of them would be nice
    #rm $pkgdir/opt/activitywatch/libicu*.so*

    # One or more of these is making aw-qt SEGFAULT
    #rm $pkgdir/opt/activitywatch/libreadline.so*
    #rm $pkgdir/opt/activitywatch/libssl.so*
    #rm $pkgdir/opt/activitywatch/libavahi*.so*
    #rm $pkgdir/opt/activitywatch/libQt5*.so*
    #rm $pkgdir/opt/activitywatch/libstdc++.so*
    #rm $pkgdir/opt/activitywatch/libgpg-error.so*
    #rm $pkgdir/opt/activitywatch/libz.so*
    #rm $pkgdir/opt/activitywatch/libharfbuzz.so*
    #rm $pkgdir/opt/activitywatch/libfreetype.so*
    #rm $pkgdir/opt/activitywatch/libX*.so*
    #rm $pkgdir/opt/activitywatch/libxcb*.so*
    #rm $pkgdir/opt/activitywatch/libwayland*.so*
    #rm $pkgdir/opt/activitywatch/libpng*.so*
    #rm $pkgdir/opt/activitywatch/libgtk*.so*
    #rm $pkgdir/opt/activitywatch/libgnutls*.so*
    #rm $pkgdir/opt/activitywatch/libcairo*.so*
    #rm $pkgdir/opt/activitywatch/libfontconfig.so*
}
