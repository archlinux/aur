pkgname=nbopen
pkgver=0.5
pkgrel=1
pkgdesc='Opens an Jupyter notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=(python jupyter 'shared-mime-info>=1.7')
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=('056794916d5bdfc9a8468781292b8228')

package() {
	pip3 install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
	
	cd "$srcdir/$pkgname"
	install -Dm755 {,"$pkgdir/usr/share/applications/"}nbopen.desktop
	
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "icons/ipynb_icon_${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/mimetypes/application-x-ipynb+json.png"
	done
	
	rm -rf "$pkgdir/usr/lib/python"*'/site-packages/nbopen/'{application-x-ipynb+json.xml,icons,nbopen.desktop}
}
