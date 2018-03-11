# Maintainer: Jonas Strassel <info@jonas-strassel.de>

pkgname=budgie-extras
pkgver=0.4.2
_commit=64846b0822d20c9150259d1152a6d75b36950c9a
pkgrel=1
pkgdesc="Additional Budgie Desktop enhancements for the user experience https://ubuntubudgie.org"
arch=('any')
license=('GPL3')
depends=('budgie-desktop' 'xorg-xprop' 'xorg-xinput' 'xorg-xrandr' 'xdotool' 'wmctrl' 'xprintidle' 'python-pyudev') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
url="https://github.com/UbuntuBudgie/$pkgname"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('cf4cb35af9db62801c90160a654d193fd3d7a908b2004388649cb14f31b23784')

prepare() {
    cd $srcdir
    mv $pkgname-$_commit $pkgname-$pkgver
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd "$srcdir/$pkgname-$pkgver/build"
    meson --prefix /usr --buildtype=plain ..
    ninja
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}
