# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=gnome-shell-extension-redshift-git
_pkgname=${pkgname%-git}
pkgver=r29.8fd6a3b
pkgrel=1
pkgdesc="Redshift integration for GNOME Shell"
arch=('any')
url="https://github.com/tommie-lie/gnome-shell-extension-redshift"
license=('GPL3')
depends=()
makedepends=('git' 'autoconf' 'automake' 'gnome-common' 'intltool')
source=("git+https://github.com/tommie-lie/gnome-shell-extension-redshift")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
