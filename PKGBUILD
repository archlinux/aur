# Maintainer: Andrew D. France <andrewforlua@gmail.com>
pkgname=autogrid4
pkgver=4.2.9
pkgrel=1
pkgdesc="Autogrid4 is a support software for docking programs such as AutoDock4 and Autodock-GPU. Its function is to precalculate the grids used by the docking software."
arch=('x86_64' 'i686')
url="https://github.com/ccsb-scripps/AutoGrid"
license=('GPL-2.0')
depends=('gcc-libs')
makedepends=('gcc' 'make' 'tcsh' 'autoconf' 'automake')

_ag4_commit="6d2847beaeac8ff43ca99094707fd74e3ca1ff37"

source=("autogrid4-$pkgver.tar.gz::https://github.com/ccsb-scripps/AutoGrid/archive/$_ag4_commit.tar.gz")
sha256sums=('4d0bd83a446fd81577f4fc492299e22f131245589e1782e0532aecf3435e772a')
# updpkgsums
# n.b., To update metadata, you run: makepkg --printsrcinfo > .SRCINFO
# git clone ssh://aur@aur.archlinux.org/autogrid4.git
build() {
    cd "$srcdir/AutoGrid-$_ag4_commit"

    echo "--> Configuring AutoGrid..."
    autoreconf -i
    ./configure --prefix=/usr

    echo "--> Building AutoGrid..."
    make
}

package() {
    install -Dm755 "$srcdir/AutoGrid-$_ag4_commit/autogrid4" "$pkgdir/usr/bin/autogrid4"
    install -Dm644 "$srcdir/AutoGrid-$_ag4_commit/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
