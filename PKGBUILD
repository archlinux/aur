# Maintainer: Finn <finn-ja@gmx.de>

pkgname=commiefetch-git
pkgver=1.0
pkgrel=1
pkgdesc="Systeminfo-Tool mit kommunistischem ASCII-Logo, Bash-Integration und versteckten Anzeigemodi"
arch=('x86_64')
url="https://gitlab.com/arch1380517/commiefetch"
license=('GPL3')
depends=()
makedepends=('git' 'gcc' 'make')
source=("git+https://gitlab.com/arch1380517/commiefetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/commiefetch"
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/commiefetch"
  make
}

package() {
  cd "$srcdir/commiefetch"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
