# Maintainer: Mirko Rovere <04mirko@libero.it>

pkgname="baracle-git"
pkgver=r29.d8e47fd
pkgrel=2
pkgdesc="Let's make a text editor like in the 70's"
arch=("x86_64")
url="https://github.com/Mirko-r/baracle"
depends=('gcc')
optdepends=('mimalloc: To use the mimalloc library instead of the standard malloc()')
license=("GPL-3.0")
conflicts=("baracle")
provides=('baracle')
makedepends=('git')
source=("git+https://github.com/Mirko-r/baracle.git")
sha512sums=("SKIP")

_name='baracle'

pkgver() {
	cd "$_name"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package(){
    gcc ${srcdir}/baracle/src/baracle.c -o baracle_out -Wall -Wextra -pedantic -std=c99
    install -Dm0755 "${srcdir}/baracle_out" "${pkgdir}/usr/bin/baracle"
}
