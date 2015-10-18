# Maintainer: aksr <aksr at t-com dot me>
pkgname=teco-git
pkgver=r14.d847c72
pkgrel=1
epoch=
pkgdesc="Tape Editor And Corrector"
arch=('i686' 'x86_64')
url="https://github.com/matthiasr/teco"
license=('unknown')
groups=()
depends=('termcap')
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
source=("$pkgname::git+https://github.com/matthiasr/teco")
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
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir" PREFIX="/usr/" bindir="bin" mandir="share/man/" install
  install -Dm644 sample.tecorc $pkgdir/usr/share/doc/$pkgname/sample.tecorc
  install -m644 sample.tecorc2 $pkgdir/usr/share/doc/$pkgname/sample.tecorc2
  install -Dm644 READ.ME $pkgdir/usr/share/doc/$pkgname/README
}

