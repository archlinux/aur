# Maintainer: Landon Porter <landonp95@gmail.com>

_pkgname=squigwire
pkgname="${_pkgname}-git"
pkgver=r4.824f98a
pkgrel=1
pkgdesc="System-wide PipeWire parametric EQ"
url="https://github.com/mazylol/squigwire"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('pipewire')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}

package() {
    cd "$srcdir/${_pkgname}"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
