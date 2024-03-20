# Maintainer:  Dominik Kummer <admin@arkades.org>

pkgname=kraft-git
pkgver=0.80beta8.r575.gc57f87e
pkgrel=1
pkgdesc="A program suitable for all trades or crafts (git)"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('akonadi-contacts' 'ctemplate' 'python-reportlab' 'python-pypdf2')
conflicts=('kraft')
provides=('kraft')
optdepends=("python-weasyprint: alternative PDF generator")
makedepends=('git' 'cmake' 'extra-cmake-modules' 'po4a')
source=(
  "${pkgname}::git+https://github.com/dragotin/kraft.git"
)
sha256sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export PATH="/usr/bin/vendor_perl/:$PATH"
  cmake -B "$pkgname/build" -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$pkgname/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$pkgname/build"
}
