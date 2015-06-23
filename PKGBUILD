# Maintainer: aksr <aksr at t-com dot me>
pkgname=vx32-git
pkgver=r350.eeb61dd
pkgrel=1
epoch=
pkgdesc="Portable, efficient, safe execution of untrusted x86 code."
arch=('i686' 'x86_64')
url="https://github.com/0intro/vx32"
license=('LGPLv2.1' 'BSD' 'LPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('vx32')
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=vx32-git.install
source=("$pkgname::git+https://github.com/0intro/vx32")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  mkdir -p $pkgdir/opt/$pkgname/{bin,lib}
  make prefix="$pkgdir/opt/$pkgname" install 
  install -Dm644 9vx/README $pkgdir/opt/$pkgname/doc/README
  install -Dm644 9vx/LICENSE $pkgdir/usr/share/licenses/$pkgname/9vx.LICENSE
  install -Dm644 libvx32/LICENSE $pkgdir/usr/share/licenses/$pkgname/libvx32.LICENSE
  install -Dm644 vxrun/LICENSE $pkgdir/usr/share/licenses/$pkgname/vxrun.LICENSE
  install -Dm644 ../doc/9vx.1 $pkgdir/opt/$pkgname/man/man1/9vx.1
  install -Dm644 ../doc/vxa.pdf $pkgdir/opt/$pkgname/doc/vxa.pdf
  install -Dm644 ../doc/vx32.pdf $pkgdir/opt/$pkgname/doc/vx32.pdf
}

