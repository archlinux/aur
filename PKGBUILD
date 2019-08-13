# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me 
pkgname=jumpcutter-git
pkgver=r17.136df10
pkgrel=1
pkgdesc="Automatically edits videos. Explanation here: https://www.youtube.com/watch?v=DQ8orIurGxw"
arch=('any')
url="https://github.com/carykh/jumpcutter"
license=('MIT')
depends=('ffmpeg' 'python-pillow' 'python-audiotsm' 'python-scipy' 'python-numpy' 'python' 'python-pytube')
makedepends=('git') 
source=("$pkgname::git+https://github.com/carykh/jumpcutter.git" '0001-Add-shebang-line.patch')
sha256sums=('SKIP'
         '33c22ce87b48e0d08081da6543f7f7610fcae4240b95d91e285a49339e601ffb')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/$pkgname"
	patch -i "$srcdir"/0001-Add-shebang-line.patch
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 jumpcutter.py "$pkgdir"/usr/bin/jumpcutter
}
