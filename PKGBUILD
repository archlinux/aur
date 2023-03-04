pkgname=walbottle-git
_name=walbottle
pkgver=0.2.0.r71.ge643df3
pkgrel=1
pkgdesc="Walbottle is a project for generating JSON unit test vectors from JSON Schemas. It provides a library, libwalbottle, which implements JSON Schema parsing and test vector generation."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/walbottle/$pkgname"
conflicts=('walbottle')
provides=('walbottle')
license=('LGPL2.1')
depends=(glib2 json-glib gobject-introspection)
source=("$_name::git+https://gitlab.com/walbottle/walbottle.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    arch-meson $_name build -Dgtk_doc=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
