# Maintainer: Your Name <youremail@domain.com>
pkgname=gnome-obfuscate-git
pkgver=0.0.2.r82.45e1e37
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
  v=$(grep -R -A3 '^project(' meson.build | grep 'version:' | cut -d\' -f2)
  printf "$v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson --prefix=/usr --buildtype=plain obfuscate build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
