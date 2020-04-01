# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=xinput_calibrator-kreijack-git
_pkgname=xinput_calibrator
pkgver=0.7.5.r98.gb82b479
pkgrel=2
pkgdesc="Generic touchscreen calibration program for X.Org - fork from kreijack"
arch=('i686' 'x86_64' 'pentium4')
url="http://www.freedesktop.org/wiki/Software/xinput_calibrator/"
license=('MIT')
source=("${_pkgname}::git+https://github.com/kreijack/${_pkgname}.git#branch=devel")
provides=('xinput_calibrator')
conflicts=('xinput_calibrator' 'xinput_calibrator-git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v//'
}


build() {
    cd "$srcdir/${_pkgname}"
    ./autogen.sh --with-gui=x11
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${_pkgname}/COPYING"
    install -Dm644 scripts/xinput_calibrator.svg "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.svg"
    install -Dm644 scripts/xinput_calibrator.xpm "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.xpm"
    install -Dm644 scripts/xinput_calibrator.desktop "$pkgdir/usr/local/share/applications/xinput_calibrator.desktop"
    install -Dm755 src/xinput_calibrator "$pkgdir/usr/local/bin/xinput_calibrator"
    cd man
    gzip xinput_calibrator.1
    install -Dm644 xinput_calibrator.1.gz "$pkgdir/usr/share/man/man1/xinput_calibrator.1.gz"
}
