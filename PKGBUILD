pkgname=nbopen
pkgver=0.4.2
pkgrel=1
pkgdesc='Opens an Jupyter notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=('python' 'jupyter' 'shared-mime-info>=1.7')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=('b1044661e46907b24f1948767b5a1049')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
	
	cd "$srcdir/$pkgname"
	install -Dm755 {,"$pkgdir/usr/share/applications/"}nbopen.desktop
	
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "icons/ipynb_icon_${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/mimetypes/application-x-ipynb+json.png"
	done
	
	rm -rf "$pkgdir/usr/lib/python"*'/site-packages/nbopen/'{application-x-ipynb+json.xml,icons,nbopen.desktop}
}
