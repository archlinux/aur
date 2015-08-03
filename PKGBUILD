# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=python-systemd-git
pkgver=230.r8.g58c65cf
pkgrel=1
pkgdesc="Systemd python bindings"
arch=('any')
url="https://github.com/systemd/python-systemd"
depends=('python systemd')
provides=python-systemd
license=('GPL3')
arch=('any')
source=("${pkgname}"::"git+https://github.com/systemd/python-systemd.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${pkgname}"
    make build
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install 
}
