# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-ex-vi-git
pkgver=4.1.3.r41.d47dc5a
pkgrel=1
epoch=
pkgdesc="The traditional Vi"
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/heirloom-ex-vi/commits/master"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('heirloom-ex-vi-cvs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/heirloom-ex-vi.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr/heirloom" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -m 644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

