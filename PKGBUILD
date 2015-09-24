# Maintainer: aksr <aksr at t-com dot me>
pkgname=irvm-git
pkgver=0.0.3.r2.g559e6c3
pkgrel=1
epoch=
pkgdesc="A Virtual Machine for Andrew W. Appel's Tree Intermediate Representation."
arch=('i686' 'x86_64')
url="https://github.com/pablooliveira/irvm"
license=('GPLv3')
groups=()
depends=('glibc')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('irvm')
conflicts=('irvm')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/pablooliveira/irvm")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}

