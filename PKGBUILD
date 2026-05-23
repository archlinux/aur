# Maintainer: Andrew <andrewforlua@gmail.com>
pkgname=autodock4
pkgver=4.2.6
pkgrel=5
pkgdesc="Automated docking of flexible ligands to proteins"
arch=('x86_64' 'i686')
url="https://github.com/ccsb-scripps/AutoDock4"
license=('GPL-2.0')
depends=('gcc-libs' 'autogrid4')
makedepends=('gcc' 'make' 'tcsh' 'autoconf' 'automake')

_ad4_commit="192ecda05d7c566161046f0a1d604f3336e0cf3a"

source=("autodock4-$pkgver.tar.gz::https://github.com/ccsb-scripps/AutoDock4/archive/$_ad4_commit.tar.gz")
sha256sums=('8c59254e214c0fa4de9faf4dcd82da1053bfb9c817dd0973c3b85b1148c9e894')
# updpkgsums
# n.d., To update metadata, you run: makepkg --printsrcinfo > .SRCINFO
# git clone ssh://aur@aur.archlinux.org/autodock4.git
build() {
    cd "$srcdir/AutoDock4-$_ad4_commit"
    
    echo "--> Configuring AutoDock..."
    autoreconf -i
    ./configure --prefix=/usr
    
    echo "--> Building AutoDock..."
    make
}

package() {
    install -Dm755 "$srcdir/AutoDock4-$_ad4_commit/autodock4" "$pkgdir/usr/bin/autodock4"
    
    install -Dm644 "$srcdir/AutoDock4-$_ad4_commit/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
    
    install -d "$pkgdir/usr/share/doc/$pkgname/"
    cp -r "$srcdir/AutoDock4-$_ad4_commit/USERGUIDES" "$pkgdir/usr/share/doc/$pkgname/"
}
