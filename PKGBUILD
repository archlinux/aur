# Maintainer: aksr <aksr at t-com dot me>
pkgname=fstransform-git
pkgver=0.9.4.r5.ga9dd88e
pkgrel=1
epoch=
pkgdesc="Tool for in-place filesystem conversion (for example from jfs/xfs/reiser to ext2/ext3/ext4) without backup"
arch=('i686' 'x86_64')
url="https://github.com/cosmos72/fstransform"
license=('GPL3')
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

