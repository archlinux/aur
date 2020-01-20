# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios-plugins
pkgver=2.2.r0.gd84975e
pkgrel=1
pkgdesc="Plugins for the gogios service checking system."
arch=('x86_64')
url="https://github.com/bkasin/gogios-plugins"
license=('MIT')

makedepends=('go' 'make')
optdepends=('nmap' 'gogios')

source=("$pkgname::git+https://github.com/bkasin/gogios-plugins.git#branch=master")
sha256sums=('SKIP')

provides=("$pkgname")
conflicts=("$pkgname-bin")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install 
}
