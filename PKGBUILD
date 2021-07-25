# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributer : GI_Jack <iamjacksemail@hackermail.com>
# Contributer: Kniyl   <mathias@mettinger.fr>
pkgname=touchegg-gce-git
pkgver=1.3.1.r10.g6f75e4c
pkgrel=1
pkgdesc="A graphical user interface for touchégg"
arch=('x86_64')
url="https://github.com/Raffarti/Touchegg-gce"
license=('GPL3')
depends=('touchegg' 'qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}.conf")
source=("${pkgname%-git}::git+https://github.com/Raffarti/Touchegg-gce.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  qmake \
    PREFIX=/usr \
    CONFIG_PATH=/etc \
    ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make -C build INSTALL_ROOT="$pkgdir" install
}
