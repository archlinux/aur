# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

_pkgname=image-optimizer
pkgname=$_pkgname-git
pkgver=0.1.25.r0.g8212165
pkgrel=1
pkgdesc="Simple lossless compression (latest commit)"
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')
arch=('x86_64' 'i686')
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
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  ln -s com.github.gijsgoudzwaard.$_pkgname "$pkgdir/usr/bin/$_pkgname"
  rm -dr "$pkgdir/usr/share/contractor"
}
