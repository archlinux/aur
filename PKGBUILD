#AUR Maintainter: JKA Network <contacto@jkanetwork.com>
pkgname=pinta-git
pkgver=1.7
pkgrel=1
pkgdesc="The game 2048 for your Linux terminal"
arch=('x86_64' 'i686')
url="https://pinta-project.com"
license=('MIT')
depends=('mono' 'gtk-sharp-2' 'mono-addins' 'yelp-tools')
makedepends=('git')
provides=('pinta' 'pinta-git')
conflicts=('pinta')
options=('!makeflags')
source=(git+https://github.com/PintaProject/Pinta.git)
md5sums=('SKIP')
pkgver() {
	cd "Pinta"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "Pinta"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}
package() {
	cd "Pinta"
	make DESTDIR="$pkgdir/" install
	install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
	install -m644 license-*.txt readme.md "$pkgdir"/usr/share/licenses/$pkgname/
}
