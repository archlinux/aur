# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: aksr <aksr at t-com dot me>
pkgname=edit-git
pkgver=0.r321.bc24e3d
pkgrel=2
pkgdesc="An experimental text editor, a relaxing mix of vi & acme."
arch=('i686' 'x86_64' 'aarch64')
url="https://c9x.me/edit/"
license=('unknown')
makedepends=('git' 'texlive-bin' 'texlive-core' 'libxft')
install=echo.install
source=("$pkgname::git://c9x.me/ed.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
  cweave vicmd; tex vicmd; pdftex vicmd
}

package() {
  cd "$srcdir/$pkgname"
  ## Renamed to Edit to avoid conflict with vi package.
  install -Dm755 obj/edit $pkgdir/usr/bin/Edit
  install -Dm644 vicmd.dvi $pkgdir/usr/share/doc/$pkgname/vicmd.dvi
  install -Dm644 vicmd.pdf $pkgdir/usr/share/doc/$pkgname/vicmd.pdf
}

