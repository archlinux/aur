# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=getextensions-git
pkgver=r17.3dc8b97
pkgrel=1
pkgdesc="Python GTK app to install extensions from extensions.gnome.org"
arch=('any')
url="https://github.com/ekistece/GetExtensions"
license=('none')
depends=('python-gobject' 'python-lxml' 'python-requests')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ekistece/GetExtensions.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '6b0b05d647f805fb5567bcb8ba2382c74d738e9ee1349d7ef1d11fa4cac9296d'
            'cdba6b7d8b9e3bc390dd3a7c9590620d44ba581b1c86ebab2a1cd6135357d43d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 *.py -t "$pkgdir/opt/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
