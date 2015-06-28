# Maintainer: aksr <aksr at t-com dot me>
pkgname=edit-git
pkgver=0.r309.b1634e6
pkgrel=1
epoch=
pkgdesc="An experimental text editor, a relaxing mix of vi & acme."
arch=('i686' 'x86_64')
url="http://c9x.me/edit/"
license=('unknown')
groups=()
depends=('')
makedepends=('git' 'texlive-bin' 'texlive-core')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=echo.install
source=("$pkgname::git://c9x.me/ed.git")
noextract=()
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

