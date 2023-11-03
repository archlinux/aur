# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

_pkgname=image-optimizer
pkgname=$_pkgname-git
pkgver=0.1.22.r2.g99ebc8a
pkgrel=1
pkgdesc="Simple lossless compression (latest commit)"
arch=('x86_64' 'i686')
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
depends=('granite' 'optipng' 'jpegoptim')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog ||:
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  ln -s com.github.gijsgoudzwaard.$_pkgname "$pkgdir/usr/bin/$_pkgname"
  rm -dr "$pkgdir/usr/share/contractor"
}
