# Maintainer: Your Name <youremail@domain.com>
pkgname=gnome-obfuscate-git
pkgver=0.0.2.r5.g45e1e37
pkgrel=1
pkgdesc="Censor private information."
arch=(x86_64)
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL')
depends=('gtk3' 'appstream-glib')
makedepends=('git' 'meson' 'rust' 'cmake')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
backup=()
options=()
install=
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd obfuscate
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain obfuscate build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
