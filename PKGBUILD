# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=gnome-shell-extension-redshift-git
_pkgname=${pkgname%-git}
pkgver=r29.8fd6a3b
pkgrel=2
pkgdesc="Redshift integration for GNOME Shell"
arch=('any')
url="https://github.com/tommie-lie/gnome-shell-extension-redshift"
license=('GPL3')
depends=()
makedepends=('git' 'autoconf' 'automake' 'pkg-config' 'gnome-common' 'intltool' 'patch')
source=("git+https://github.com/tommie-lie/gnome-shell-extension-redshift"
        "metadata.patch")
md5sums=('SKIP'
         'cf1f66a9f06d7e403221d82615a9eace')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname/src
  patch -p0 < $startdir/metadata.patch
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
