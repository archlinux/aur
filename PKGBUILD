# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch-git
pkgver=r85.50ddd29
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
license=(LicenseRef-None)
url="https://github.com/Spyhoodle/pridefetch"
source=("git+https://github.com/Spyhoodle/pridefetch")
depends=('python3' 'python-distro')
makedepends=('git')
provides=('pridefetch')
conflicts=('pridefetch')
sha512sums=('SKIP')

pkgver() {
	cd "pridefetch"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	cd ..
}

package() {
	cd "$srcdir/${pkgname::-4}/src"
	bsdtar -a -cf "$srcdir/pridefetch.zip" *
	echo "#!/usr/bin/env python" | cat - "$srcdir/pridefetch.zip" > "$srcdir/pridefetch-bin"
	install -Dm755 "$srcdir/pridefetch-bin" "$pkgdir/usr/bin/pridefetch"
}
