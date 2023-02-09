_pkgname="annotator"
pkgname=$_pkgname-git
pkgver=1.1.1.r85.ge18f5eb
pkgrel=1
pkgdesc="Image annotation for Elementary OS"
url='https://github.com/phase1geo/Annotator'
license=("GPL3")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=(
  'granite'
  'libhandy'
)
makedepends=('git' 'meson' 'vala')
provides=($_pkgname)
conflicts=(${provides[@]})
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  meson build --prefix=/usr	
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install

  # symlink
  ln -sf "/usr/bin/com.github.phase1geo.annotator" "$pkgdir/usr/bin/annotator"
}

