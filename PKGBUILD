# Maintainer: LycanDarko lycandarko (at) proton.me
pkgname=rabbithole
pkgver=b0.8.3.r21
pkgrel=1
epoch=
pkgdesc="The Meta-Window Manager. An extra-dimensional, lightning-fast UI made for enhancing productivity—A second brain interface. Built from the awesome window manager framework. GitHub Master branch."
arch=('x86_64')
url='https://github.com/SaintRyoh/rabbithole'
license=('GPL3')
groups=()
depends=(awesome rofi autorandr picom ttf-ubuntu-font-family lxqt-policykit lxqt-powermanagement tmux volumeicon network-manager-applet blueman flameshot rofi-themes-collection-git beautyline linux-wifi-hotspot)
makedepends=('git')
checkdepends=()
optdepends=()
conflicts=(awesome-git)
install=rabbithole.install
source=(${pkgname}::git+$url.git#branch=AUR)
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --abbrev=7 --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

package() {
    # Install the rabbithole config to /usr/share/rabbithole
    install -dm755 "$pkgdir/usr/share/rabbithole"
    cp -r "$srcdir/$pkgname/"* "$pkgdir/usr/share/rabbithole"
    
    # Install the rabbithole.desktop to /usr/share/xsessions
    install -Dm644 "$srcdir/$pkgname/installer/rabbithole.desktop" "$pkgdir/usr/share/xsessions/rabbithole.desktop"
    
    # Install readme to /usr/share/doc/rabbithole
    install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/rabbithole"
    
    # Install rabbithole script to /usr/bin
    install -Dm755 "$srcdir/$pkgname/installer/rabbithole" "$pkgdir/usr/bin/rabbithole"
    chmod +x "$pkgdir/usr/bin/rabbithole"
}
