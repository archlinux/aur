# Maintainer: aksr <aksr at t-com dot me>
pkgname=mujs-git
pkgver=r615.14dc935
pkgrel=1
epoch=
pkgdesc="A lightweight Javascript interpreter designed for embedding in other software to extend them with scripting capabilities."
arch=('i686' 'x86_64')
url="http://mujs.com/"
license=('AGPL3')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=('mujs')
conflicts=('mujs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.ghostscript.com/mujs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" prefix="/usr" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  cd docs/; for i in *; do
    install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i
  done
}

