pkgname=paper-icon-theme-git
pkgver=805.8c7bf8d2
pkgrel=1
pkgdesc="Paper is an icon theme for GTK based desktops and fits perfectly the paper-gtk-theme"
arch=(any)
url="https://github.com/snwh/paper-icon-theme"
license=('CC BY-SA 4.0')
depends=('gtk-update-icon-cache')
makedepends=('git' 'meson')
provides=('paper-icon-theme')
source=("$pkgname"::'git+https://github.com/snwh/paper-icon-theme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${pkgname}"
    meson build --prefix=/usr
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" ninja -C "build" install
}
