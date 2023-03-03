# Maintainer: Ecorous <ecorous@frogastudios.com>
pkgname=mpcreator-git
pkgver=1.1.1
pkgrel=1
arch=('x86_64')
pkgdesc="An unofficial Minecraft mod project generator for QuiltMC in Nim. Git version"
license=('Apache')
groups=()
depends=('glibc')
makedepends=('git' 'nim')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('git+https://github.com/Ecorous/mpcreator')
noextract=()
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    nimble linux
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/${pkgname%-git}/build/mpcreator_"*"_linux_release" "$pkgdir/usr/bin/mpcreator"
}
