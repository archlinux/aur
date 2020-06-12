# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=coffee-git
pkgver=2.2.0.r8.g2bae117
pkgrel=2
pkgdesc="Keep up with current news and weather with Coffee"
arch=('x86_64')
url='https://nick92.github.io/coffee/'
license=('GPL3')
depends=('gtk3' 'geoclue' 'libgee')
makedepends=('git' 'meson' 'vala')
provides=('coffee')
conflicts=('coffee')
source=('coffee::git+https://github.com/nick92/coffee.git')
sha256sums=('SKIP')

pkgver() {
    cd coffee
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    arch-meson coffee build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
