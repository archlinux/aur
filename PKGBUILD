# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=torrent7z
pkgver=1.3+6+gcb2c3ab
pkgrel=1
pkgdesc="A derivative of 7zip that produces invariant .7z archives for torrenting"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/BubblesInTheTub/torrent7z"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
source=("$pkgname::git+$url.git#commit=cb2c3ab9c94b9f9f2b77ddd889d99273ea203269")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/-/+/g'
}

build() {
	make -C $pkgname/linux_src/p7zip_4.65
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin $pkgname/linux_src/p7zip_4.65/bin/t7z
}
