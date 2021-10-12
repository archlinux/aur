# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=nscde-git
pkgver=latest
pkgrel=1
pkgdesc='Modern and functional CDE desktop based on FVWM'
arch=('any')
url='https://github.com/NsCDE/NsCDE/'
depends=('ksh' 'xdotool' 'imagemagick' 'python-yaml' 'python-pyqt5'
    'qt5ct' 'qt5-styleplugins' 'stalonetray' 'xterm' 'python-psutil'
    'python-pyxdg' 'libstroke' 'xsettingsd' 'fvwm3' 'perl-file-mimeinfo'
    'gkrellm' 'rofi' 'xclip')
optdepends=('xscreensaver')
conflicts=('nscde')
provides=('nscde')
license=('GPL3')
source=('git+https://github.com/NsCDE/NsCDE.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/NsCDE/"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/NsCDE/src/XOverrideFontCursor/"
    make
}

package() {
    cd "$srcdir/NsCDE/"
    ./Installer.ksh -f -n -D "$pkgdir" -i
}
