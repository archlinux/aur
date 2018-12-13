# Maintainer: RedTide <redtid3@gmail.com>

pkgname=smarthhc
pkgver=r2.125f492
pkgrel=1
pkgdesc="Digital HiHat Controller"
url="https://github.com/azdrums/smarthhc"
arch=('x86_64')
license=('MPL-2.0')
# install=smarthhc.install
depends=('qt5-base' 'qt5-serialport' 'qt5-connectivity')
optdepends=('bluez: to work with bluetooth device')
makedepends=('git')
source=(
    "$pkgname"::"git+https://github.com/azdrums/smarthhc.git"
    "smarthhc.desktop"
)
md5sums=(
    'SKIP'
    'c4bbe0c1137422064fd6240d07513a5e'
)
# TODO: Temporary use of revision numbers, will use annotated tags using
#       git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#       See https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    qmake PREFIX="/usr/" SmartHHC.pro
    make INSTALL_DIR=$pkgdir
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT=$pkgdir install
    install -D -m644 $srcdir/smarthhc.desktop $pkgdir/usr/share/applications/smarthhc.desktop
}
