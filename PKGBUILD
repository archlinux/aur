pkgname=piscesys-gtk-themes-git
_pkgname=piscesys-gtk-themes
pkgver=0.9
pkgrel=1
pkgdesc="piscesys gtk dark/light themes"
arch=('any')
url="https://gitlab.com/piscesys/gtk-themes"
license=('GPL')
depends=()
makedepends=('extra-cmake-modules' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-gtk-themes-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd gtk-themes
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gtk-themes

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd gtk-themes
  make DESTDIR="$pkgdir" install
}
