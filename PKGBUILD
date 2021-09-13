# Maintainer: Reinaldo Molina <me at molinamail dot com>
pkgname=i3help-git
__name=i3help
pkgver=r14.74a56cf
pkgrel=1
epoch=
pkgdesc="Dialog to show key bindings for i3wm"
arch=('i686' 'x86_64')
url="https://github.com/glennular/i3help"
license=('GPL3')
depends=('gtk3' 'glib2')
makedepends=('autoconf' 'automake' 'git')
source=("git+https://github.com/glennular/i3help#branch=main")
md5sums=('SKIP')

pkgver() {
    cd "$__name"
      ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      )
}

build() {
	cd "$__name"
  autoreconf --force --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$__name"
	make DESTDIR="$pkgdir/" install
}

