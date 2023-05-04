# Maintainer: Kristóf Marussy <kris7topher at gmail dot com>
# Maintainer: PixlOne <pixlone@pm.me>
# Contributor: Afnan Enayet <afnan@afnan.io>

pkgname=logiops-git
_pkgname="logiops"
_gitpkgname="logiops"
epoch=1
pkgver=0.3.1.r0.ga77b328
pkgrel=1
pkgdesc="An unofficial driver for Logitech HID++>2.0 mice and keyboard"
arch=('x86_64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libevdev' 'systemd' 'libconfig' 'glib2')
makedepends=('git' 'cmake' 'gcc')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/PixlOne/$_gitpkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitpkgname"
    git describe --tags --long | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$_gitpkgname"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
