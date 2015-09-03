# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=pit-git
_gitname=pit
pkgver=0.1.0.r9.g4d20557
pkgrel=1
pkgdesc="A command-line project manager that integrates with Git."
arch=(i686 x86_64)
url="https://github.com/michaeldv/pit"
license=(custom:BSD)
provides=(pit)
conflicts=(pit)
makedepends=(git)
depends=(glibc)
source=(git+https://github.com/michaeldv/pit)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  mkdir -p "$pkgdir"/usr/bin
  make PREFIX="$pkgdir/usr" install
  install -D LICENSE "$pkgdir"/usr/share/licenses/pit-git/LICENSE
}
