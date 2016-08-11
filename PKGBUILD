# Maintainer: aksr <aksr at t-com dot me>
pkgname=grab-git
pkgver=0.1s.r9.gac3b1b3
pkgrel=1
epoch=
pkgdesc="Simple but very fast grep"
arch=('i686' 'x86_64')
url="https://github.com/stealth/grab"
license=('MIT')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('grab')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/stealth/grab.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^grab.//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 grab $pkgdir/usr/bin/grab
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  sed '1,32!d' grab.cc > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

