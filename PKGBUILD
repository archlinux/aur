# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname=image-optimizer
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple lossless compression"
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
arch=('x86_64')
depends=('gtk4' 'optipng' 'jpegoptim')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6c0ca0160b4c1235ba2b906e3fb295b058d48b3710023f84de5c0808acd18c76')

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
