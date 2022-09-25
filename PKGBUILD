##
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>

pkgname=guile-config-git
pkgver=0.5.1
pkgrel=1
pkgdesc="Configuration management library for GNU Guile (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
depends=('guile')
provides=("guile-config=$pkgver")
source=("${pkgname%-git}::git+https://gitlab.com/a-sassmannshausen/guile-config.git")
url="https://gitlab.com/a-sassmannshausen/guile-config"
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | sed 's+^v++' | tr - .
}

build() {
  cd ${pkgname%-git}
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
