_appname=gnome-shell-communitheme
pkgname="${_appname}-git"
pkgver=a6ca20f
pkgrel=1
pkgdesc="GNOME Shell Ubuntu community theme "communitheme""
arch=('any')
url="https://github.com/Ubuntu/gnome-shell-communitheme"
license=('GPL3')
depends=('gtk3')
makedepends=('meson' 'ninja')
source=("${pkgname}::git+https://github.com/Ubuntu/gnome-shell-communitheme.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git rev-parse --short HEAD
}

build() {
    cd "${pkgname}"
    # Remove any potential residual build files
    rm -rf build
    meson build --buildtype=release --prefix=/usr
    ninja -C build
}

package() {
    cd "${pkgname}"
    env DESTDIR="$pkgdir" ninja -C build install
}
