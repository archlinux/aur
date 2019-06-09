# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Aaron Moore <aaron@atamisk.net>
pkgname=gllock-git
pkgver=r64.c77658b
pkgrel=1
epoch=
pkgdesc="Not so simple opengl based X display locker utility"
arch=('x86_64')
url="https://github.com/kuravih/gllock"
license=('MIT')
depends=('git' 'xorgproto' 'glew')
makedepends=()
optdepends=()
source=("git+https://github.com/kuravih/gllock.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch < ../../install-patch.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	pwd
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
