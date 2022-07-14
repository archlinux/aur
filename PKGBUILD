# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch-git
pkgver="r79.9ed33d7"
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/Spyhoodle/pridefetch"
source=("git+https://github.com/Spyhoodle/pridefetch")
depends=('python3' 'python-distro')
makedepends=('git' 'zip')
provides=('pridefetch')
conflicts=('pridefetch')
sha512sums=('SKIP')

pkgver() {
	cd "pridefetch"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	cd ..
}

package() {
	cd pridefetch/src
	zip -r ../pridefetch.zip *
	cd ..
	echo "#!/usr/bin/env python" | cat - pridefetch.zip > pridefetch
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}
