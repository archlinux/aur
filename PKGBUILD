# Maintainer: AmdaU <jbat2000@gmail.com>
pkgname=oh-my-fish-git
pkgver=r964.53b5a1b
pkgrel=1
pkgdesc="The Fish Shell Framework"
arch=('any')
url="https://github.com/oh-my-fish/oh-my-fish"
license=('MIT')
depends=('fish')
makedepends=('git')
provides=('oh-my-fish')
conflicts=('oh-my-fish')
source=("${pkgname}::git+https://github.com/oh-my-fish/oh-my-fish.git")
sha256sums=('SKIP')
				 
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -dm755 "$pkgdir/usr/share/oh-my-fish"
	cp -r . "$pkgdir/usr/share/oh-my-fish/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -dm755 "$pkgdir/usr/share/fish/vendor_conf.d"
	printf 'set -gx OMF_PATH /usr/share/oh-my-fish\nsource $OMF_PATH/init.fish\n' \
		> "$pkgdir/usr/share/fish/vendor_conf.d/oh-my-fish.fish"
}
