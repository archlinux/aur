# Maintainer: Matthias Fulz <mfulz at olznet dot de>
_pkgname=archbuilder
pkgname=archbuilder-git
pkgver=v0.9.4.r1.g29f32e4
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://github.com/mfulz/archbuilder'
arch=('any')
source=(
        'git+https://github.com/mfulz/archbuilder'
       )
sha256sums=('SKIP')
conflicts=('archbuilder')
provides=("archbuilder=${pkgver%%.r*}")
depends=('buildah')

backup=(
        'etc/archbuilder/archbuilder.env'
       )

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
