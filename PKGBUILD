# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=shadowtube
pkgver=1.1.1
pkgrel=1
pkgdesc="A YouTube shadowban detection program."
arch=('any')
url="https://github.com/danehobrecht/shadowtube"
license=('GPL')
depends=("python>=3.7.3" "python-pip" "torbrowser-launcher")
source=("https://github.com/danehobrecht/shadowtube/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('28f81a7b63ed21ff3dbaeec07a4c99c8f0d5e5458701dde2792c53ca1ec9af2e')

build() {
	python -m venv "$srcdir"/venv    
	source "$srcdir"/venv/bin/activate
	pip install --upgrade pip
	pip install -r "$srcdir/$pkgname-$pkgver/requirements.txt"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 shadowtube "$pkgdir/usr/bin/shadowtube"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 settings.json "$pkgdir/etc/shadowtube/settings.json"
}