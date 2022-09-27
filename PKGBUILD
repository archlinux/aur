#PKGBUILD was last modified on September 27, 2022 at 03:54 PM EDT by bms#
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>

pkgname=guile-hall-git
pkgver=0.4.1.r30.g36dd0c6
pkgrel=2
pkgdesc="Project manager and build tool for GNU guile (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
depends=('guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
provides=("guile-hall=$pkgver")
source=("${pkgname%-git}::git+https://gitlab.com/a-sassmannshausen/guile-hall.git"
	"guile-hall-git-xdg-fix.patch")
url="https://gitlab.com/a-sassmannshausen/guile-hall"
sha256sums=('SKIP'
	    '0ea14d5f9fcf8ccf81c6235be643109671d7db691e3f8e55eca4d1326851224d')
options=(!strip)

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+' | sed 's+^v++' | tr - .
}

prepare() {
  cd "${pkgname%-git}"
  git apply ../guile-hall-git-xdg-fix.patch
  autoreconf -vif
  ./configure --prefix=/usr
}

build() {
  cd "${pkgname%-git}"
  make
}

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
