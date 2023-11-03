# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname=image-optimizer
pkgver=0.1.22
pkgrel=2
pkgdesc="Simple lossless image optimizer"
arch=('x86_64' 'i686')
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
depends=('granite' 'optipng' 'jpegoptim')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog ||:
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -s com.github.gijsgoudzwaard.$pkgname "$pkgdir/usr/bin/$pkgname"
  rm -dr "$pkgdir/usr/share/contractor"
}
