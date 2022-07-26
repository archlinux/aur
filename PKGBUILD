# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=nscde-git
pkgver=2.2.r2.g28a4a4a1
pkgrel=1
pkgdesc='Not so Common Desktop Environment - modern and functional CDE desktop based on FVWM (git version)'
arch=('x86_64')
url='https://github.com/NsCDE/NsCDE/'
license=('GPL3')
depends=('libxext' 'libx11' 'libxpm' 'stalonetray' 'xsettingsd' 'fvwm' 'ksh'
         'imagemagick' 'xorg-xprop' 'xorg-xrdb' 'xorg-xset' 'xorg-xdpyinfo' 'xorg-xrefresh'
         'xorg-xmodmap' 'xorg-xrandr' 'gcc' 'xterm' 'python3' 'python-pyxdg' 'python-yaml'
         'python-psutil' 'python-qtpy' 'xdotool' 'xdg-utils' 'gettext')
optdepends=('xclip: copy screen, window of area shot to X11 clipboard'
            'xscreensaver: enhanced X screensaver'
            'dunst: standalone Notification Daemon'
            'dex: run desktop definitions from "${HOME}/.config/autostart"'
            'gtk2: pixmap engine for theme and Qt gtk engine is here'
            'qt5-styleplugins: integrate gtk2 NsCDE theme with Qt5'
            'qt5ct: Qt5 Configuration Utility'
            'gkrellm: system monitor package fits nicely with NsCDE')
makedepends=('git' 'xorgproto')
provides=('nscde')
conflicts=('nscde')
source=('git+https://github.com/NsCDE/NsCDE.git')
sha256sums=('SKIP')

pkgver() {
    git -C NsCDE describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd NsCDE
    ./configure --prefix='/usr' --libexecdir='/usr/lib'
    make
}

package() {
    make -C NsCDE DESTDIR="$pkgdir" install
}
