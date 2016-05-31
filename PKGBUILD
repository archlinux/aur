pkgname=nbopen
pkgver=0.3
pkgrel=3
pkgdesc='Opens an IPython notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=('python' 'jupyter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('755586703000f635ebf842f6e37dc60c')
install=$pkgname.install

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	
	install -Dm755 {,"$pkgdir/usr/share/mime/packages/"}application-x-ipynb+json.xml
	install -Dm755 {,"$pkgdir/usr/share/applications/"}nbopen.desktop
	
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "icons/ipynb_icon_${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/mimetypes/application-x-ipynb+json.png"
	done
}
