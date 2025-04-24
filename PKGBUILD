# Maintainer: Finn <finn-ja@gmx.de>

pkgname=commiefetch-git
pkgver=1.0  # <- Platzhalter, echte Version kommt aus pkgver()
pkgrel=1
pkgdesc="Revolutionäres CLI-Tool zum Anzeigen von Systeminfos mit Hammer-und-Sichel-Logo und automatischer Bashrc-Integration"
arch=('x86_64')
url="https://gitlab.com/arch1380517/commiefetch"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
source=("git+https://gitlab.com/arch1380517/commiefetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/commiefetch"
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/commiefetch"
  gcc commiefetch.c -o commiefetch
}

package() {
  cd "$srcdir/commiefetch"
  install -Dm755 commiefetch "$pkgdir/usr/bin/commiefetch"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
