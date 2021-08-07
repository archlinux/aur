# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurutils-git
pkgver=3.0.0.r6.g868691f
pkgrel=2
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=('git+https://github.com/AladW/aurutils')
sha256sums=('SKIP')
conflicts=('aurutils')
provides=("aurutils=${pkgver%%.r*}")
depends=('git' 'jq' 'pacutils' 'curl' 'expect')
makedepends=('git')
optdepends=('bash-completion: bash completion'
            'devtools: aur-chroot'
            'vifm: build file interaction')

pkgver() {
    cd aurutils
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd aurutils
    make
}

package() {
    cd aurutils
    make DESTDIR="$pkgdir" install
}
