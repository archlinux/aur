# Maintainer: aksr <aksr at t-com dot me>
pkgname=mblaze-git
pkgver=r856.817a111
pkgrel=1
epoch=
pkgdesc="Unix utilities to deal with Maildir"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/mblaze"
license=('publicdomain')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=('mblaze')
conflicts=('mblaze' 'santoku')
replaces=('santoku-git')
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/mblaze.git")
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
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -m644 filter.example $pkgdir/usr/share/doc/${pkgname%-*}/filter.example
  install -m644 mlesskey.example $pkgdir/usr/share/doc/${pkgname%-*}/mlesskey.example
  for i in contrib/*; do
    install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i 
  done
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

