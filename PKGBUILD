# Maintainer: Raafat Turki <raafat.turki@pm.me>

pkgname=umess-git
pkgver=0.1.r1.gc096279
pkgrel=1
pkgdesc="A simple X pop-up"
arch=('x86_64')
license=('MIT')
url="https://github.com/kompoth/micromess"
source=("${pkgname}::git+https://github.com/kompoth/micromess.git")
depends=('libx11' 'libxrandr' 'libxft')
makedepends=('git')
provides=(umess)
conflicts=(umess)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  if git describe --long --tags &>/dev/null; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
