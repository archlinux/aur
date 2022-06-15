# Maintainer: Kristóf Marussy <kris7topher at gmail dot com>
# Maintainer: PixlOne <pixlone@pm.me>
# Contributor: Afnan Enayet <afnan@afnan.io>

pkgname=logiops-git
_pkgname="logiops"
_gitpkgname="logiops"
epoch=1
pkgver=0.2.3.r18.gdbe2b28
pkgrel=1
pkgdesc="An unofficial driver for Logitech HID++>2.0 mice and keyboard"
arch=('x86_64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libevdev' 'systemd' 'libconfig')
makedepends=('git' 'cmake')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/PixlOne/$_gitpkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitpkgname"
    # We must pass --tags, because v0.2.3 is a lightweight (not annotated) tag.
    git describe --tags --long | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_gitpkgname"
    mkdir -p build
    cd build
    rm -rf *
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$_gitpkgname/build"
    make install DESTDIR="$pkgdir"
}
