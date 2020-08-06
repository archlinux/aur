# Maintainer: Eli Stone <eli.stonium@gmail.com>

pkgname=qencoder
_name="${pkgname#python-}"
pkgver=1.5.6
pkgrel=1
pkgdesc='A Qt video encoder GUI for open codec formats'
url='https://github.com/natis1/qencoder'
arch=('any')
license=('GPL3')
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"qencoder.desktop"
)
makedepends=('python-setuptools')
depends=(
	'python' 'python-pyqt5' 'python-psutil'
	'opencv'
	'python-scipy' 'python-numpy'
	'libvpx' 'aom' 'ffmpeg' 
)
optdepends=('vmaf: Target vmaf support',
'python-scenedetect: Splitting based on scenedetect instead of (the slower but more accurate) firstpass')

sha256sums=('4f19e4392bdc99cfdb40548b141c67c9173d04a096bb5658b417035eecede8dd'
            '3e9786a3fe1b7d6e3798fcf07cdd1e5db29e125cdc4c559dc095a8b1a143b1a5')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	install -Dm644 qencoder.desktop "$pkgdir/usr/share/applications/qencoder.desktop"
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
