# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='cecilia'
_reponame="${pkgname}5"
pkgver='5.4.0'
pkgrel='1'
pkgdesc='Audio signal processing environment aimed at sound designers'
arch=('any')
url="http://ajaxsoundstudio.com/software/$pkgname"
license=('GPL3')
depends=('python' 'python-pyo>=1.0.1' 'python-numpy>=1.18' 'python-wxpython>=4.0.7')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/belangeo/$_reponame/archive/$pkgver.tar.gz"
	"$pkgname.sh"
	"$pkgname.desktop"
)
sha256sums=('00c43539da73af982b136ab5ea6809ac9bb74188b05eb40d13428d13fe2ebef0'
            '0a17c0f9d4eb7195faaa99975628b610c821185f3ad712894029e5a135a54d4b'
            'ee8cec128bcfd52a5110c0dfae237130635b4e89e4746ccdc46df9aa3b1fd48f')

package() {
	cd "$srcdir/$_reponame-$pkgver/"

	local _libdir="usr/lib/$pkgname"

	install -Dm644 "${_reponame^}.py" "$pkgdir/$_libdir/${_reponame^}.py"
	cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

	install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	ln -sf "/$_libdir/Resources/${_reponame^}.ico" "$pkgdir/usr/share/pixmaps/$pkgname.ico"
}
