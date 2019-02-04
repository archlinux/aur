# Maintainer: aksr <aksr at t-com dot me>
pkgname=lr-git
pkgver=1.4.r3.g84af038.r222.84af038
pkgrel=1
epoch=
pkgdesc="List files, recursively"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/lr"
license=('MIT')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/lr.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -Dm644 contrib/lr.el $pkgdir/usr/share/${pkgname%-*}/lr.el
  install -Dm644 contrib/lr.vim $pkgdir/usr/share/${pkgname%-*}/lr.vim
  install -Dm755 contrib/lrls $pkgdir/usr/share/${pkgname%-*}/lrls
  install -Dm755 contrib/lrocate $pkgdir/usr/share/${pkgname%-*}/lrocate
}

