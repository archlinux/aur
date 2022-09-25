##
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>

pkgname=guile-hall-git
pkgver=0.4.1.r30.g36dd0c6
pkgrel=1
pkgdesc="Project manager and build tool for GNU guile (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
depends=('guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
provides=("guile-hall=$pkgver")
source=("${pkgname%-git}::git+https://gitlab.com/a-sassmannshausen/guile-hall.git")
url="https://gitlab.com/a-sassmannshausen/guile-hall"
sha256sums=('SKIP')
options=(!strip)

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

check() {
  cd ${pkgname%-git}
  make check
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
