# Maintainer: Joona <julia@joonatoona.me> 
# Maintainer: Primetoxinz <primetoxinzz@gmail.com>

pkgname=hearthlauncher-git
pkgver=0.041.r43.g57961b4
pkgrel=1
pkgdesc="A Minecraft Launcher and Modpack Installer"
arch=('x86_64')
url="https://hearthproject.uk"
license=('GPL')
depends=('qt5-base' 'zlib' 'quazip' 'qt5-svg')
makedepends=('git' 'cmake' 'ninja')
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
    install -Dm755 $srcdir/$pkgname/build/HearthLauncher "$pkgdir/usr/bin/hearthlauncher"
}
