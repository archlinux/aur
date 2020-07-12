# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Primetoxinz <primetoxinzz@gmail.com>
# Contributor: Joona <julia@joonatoona.me>

pkgname=hearthlauncher-git
pkgver=0.058.r0.gf972f3c
pkgrel=1
pkgdesc="Minecraft launcher and modpack installer"
arch=('x86_64')
url="https://gitlab.com/HearthProject/HearthLauncher"
license=('GPL')
depends=('qt5-base' 'zlib' 'quazip' 'qt5-svg')
makedepends=('git' 'cmake' 'clang' 'ninja')
source=("$pkgname::git+https://gitlab.com/HearthProject/HearthLauncher.git")
sha512sums=('SKIP')
provides=('hearthlauncher')
conflicts=('hearthlauncher')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    
    mkdir -p build
    cd build
    cmake ../src -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -G Ninja
    ninja
}

package() {
    install -Dm755 $srcdir/$pkgname/build/HearthLauncher $pkgdir/usr/bin/hearthlauncher
    install -D $srcdir/$pkgname/packaging/HearthLauncher.png $pkgdir/usr/share/pixmaps/hearthlauncher.png
    install -D $srcdir/$pkgname/packaging/HearthLauncher.desktop $pkgdir/usr/share/applications/hearthlauncher.desktop
}
