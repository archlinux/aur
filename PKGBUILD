# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname=image-optimizer
pkgver=0.1.23
pkgrel=1
_commit=4d525e9cc0792331a1435c351014152c93bb7dd5
pkgdesc="Simple lossless compression"
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
arch=('x86_64' 'i686')
depends=('granite' 'optipng' 'jpegoptim')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -s com.github.gijsgoudzwaard.$pkgname "$pkgdir/usr/bin/$pkgname"
  rm -dr "$pkgdir/usr/share/contractor"
}
