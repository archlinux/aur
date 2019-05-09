# Maintainer: aksr <aksr at t-com dot me>
pkgname=v6shell-git
pkgver=20100430.r33.g283c8b5
pkgrel=1
epoch=
pkgdesc="V6 Thompson Shell Port"
arch=('i686' 'x86_64')
url="http://v6shell.org/"
url="https://github.com/quajo/v6shell.git"
license=('custom')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/quajo/v6shell.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//;s/^release.osh.//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  cd "$srcdir/$pkgname/examples"
  mkdir -p "$pkgdir/usr/share/doc/${pkgname%-*}/examples"
  cp -a * "$pkgdir/usr/share/doc/${pkgname%-*}/examples"
}

