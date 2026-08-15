# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname=image-optimizer
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple lossless compression"
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
arch=('x86_64')
depends=('gtk4' 'optipng' 'jpegoptim')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('37913b24ade2591fbbd7a6f0a348f5afb09e787e206542a94e1272cd0ba36b75')

build() {
  arch-meson Image-Optimizer-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 Image-Optimizer-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -s com.github.gijsgoudzwaard.$pkgname "$pkgdir/usr/bin/$pkgname"
}
