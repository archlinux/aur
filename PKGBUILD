# Maintainer: Eli Stone <eli.stonium@gmail.com>

pkgname=qencoder
_name="${pkgname#python-}"
pkgver=1.5.1
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
	'opencv' 'python-scenedetect'
	'python-scipy' 'python-numpy'
	'libvpx' 'aom' 'ffmpeg' 
)
sha256sums=('8e1ad59b00ff6624ad0252dbd6886e0f45cba0e3a0b73ffceebe6c1829b18ff4'
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
