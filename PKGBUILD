# Maintainer: aksr <aksr at t-com dot me>
pkgname=v6shell-git
pkgver=4.9.0.r14.g667288b
pkgrel=1
epoch=
pkgdesc="V6 Thompson Shell Port"
arch=('i686' 'x86_64')
url="http://v6shell.org/"
url="https://github.com/JNeitzel/v6shell"
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
source=("$pkgname::git+https://github.com/JNeitzel/v6shell.git"
        "v6scripts::git+https://github.com/JNeitzel/v6scripts.git")
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  cd "$srcdir/v6scripts"
  mkdir -p "$pkgdir/usr/share/doc/${pkgname%-*}/scripts"
  cp -a * "$pkgdir/usr/share/doc/${pkgname%-*}/scripts"
}

