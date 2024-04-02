# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=torrent7z
pkgver=1.3+6+gcb2c3ab
pkgrel=2
pkgdesc="A derivative of 7zip that produces invariant .7z archives for torrenting"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/BubblesInTheTub/torrent7z"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('git')
_commit=cb2c3ab9c94b9f9f2b77ddd889d99273ea203269
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('be02017efe8fce6fb7db01bd40f6ace8d46546b1bde5812922c5ef78c7f1cf958ee60b856c914bd465579d8534e37c8f98e94d44566469c92de71f04068f5fd5')

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
