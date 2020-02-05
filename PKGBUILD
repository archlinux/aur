# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=rigetti-quilc-git
_pkgname=quilc
pkgver=r494.b729f62
pkgrel=1
pkgdesc="The @rigetti optimizing Quil compiler."
arch=('x86_64' 'i686')
url="https://github.com/rigetti/quilc"
license=('Apache')
depends=('sbcl' 'quicklisp' 'zeromq' )
makedepends=( 'git' )
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("git+https://github.com/rigetti/quilc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	make quilc
}

check() {
	cd "$_pkgname"
	make test
}

package() {
	cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/usr" PREFIX="" install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
