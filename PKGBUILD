pkgname=paper-icon-theme-git
pkgver=800.7860fba8
pkgrel=1
pkgdesc="Paper is an icon theme for GTK based desktops and fits perfectly the paper-gtk-theme"
arch=(any)
url="https://github.com/snwh/paper-icon-theme"
license=('CC BY-SA 4.0')
depends=('gtk-update-icon-cache')
makedepends=('git' 'automake')
provides=('paper-icon-theme')
source=("$pkgname"::'git+https://github.com/snwh/paper-icon-theme.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "${pkgname}"
    meson build --prefix=/usr
}

build() {
    cd "${pkgname}/build"
    ninja
}

package() {
    cd "${pkgname}/build"
    DESTDIR="$pkgdir" ninja install
}
