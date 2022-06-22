pkgname=gdmap-gtk3-git
pkgver=a
pkgrel=1
pkgdesc="Tool to inspect the used space of folders."
arch=('x86_64')
url="https://gitlab.com/sjohannes/gdmap"
license=('GPL')
depends=('gtk3')
makedepends=('gettext' 'intltool')
source=("${pkgname}"'::git+https://gitlab.com/sjohannes/gdmap.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's#.*/##; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain "./$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
