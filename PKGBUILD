# Maintainer: Nicolas LLOBERA <nllobera@gmail.com>
pkgname="hl-git"
pkgver=1.69
pkgrel=1
pkgdesc="Highlight (colorize) text data using regular expressions"

arch=('i686' 'x86_64')
url="https://github.com/mbornet-hl/hl"
license=('GPL3')

depends=('glibc')
makedepends=('gcc' 'flex' 'make' 'git')

source=("git+https://github.com/mbornet-hl/hl")
md5sums=(SKIP)

pkgver() {
  #cat "$srcdir/hl/src/cr_main.c" | grep -Eo 'Version [[:digit:]]+.[[:digit:]]+' | cut -d ' ' -f2
  cat "$srcdir/hl/src/cr_main.c" | grep -Po '(?<=Version )[[:digit:]]+.[[:digit:]]+'
}

build() {
	cd "$srcdir/hl/src"
	rm hl
	sed "s/inline //g" -i cr_main.c
	make
}

package() {
	cd "$srcdir/hl/src"
	install -d "$pkgdir/usr/bin"
	install -m755 hl "$pkgdir/usr/bin/hl"
}
