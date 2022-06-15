# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.6
pkgrel=2
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz
15.patch)
b2sums=('40c311a1083779c8fa08e53684d34a3dd04faf877f25aa049d5143c10097e211cef85faf3d894d44f2888fa60fb5484da817f79dfb0b552b51a3881fa4bc2640'
        '889ca8d0b610b71bc6476f54cac5a8181af1924b2debd6b764d2b674938acffdaeb9d0cc765519325e48162bdbd2c4dff9a0f7ef9240790c697153cc82350b13')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/15.patch"
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
