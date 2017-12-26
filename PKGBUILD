# Maintainer: Tony Lambiris <tony@critialstack.com>

pkgname=veles
pkgver=2017.06.0.1
pkgrel=3
pkgdesc='Binary data analysis and visualization tool'
arch=('x86_64')
url="https://codisec.com/veles/"
license=('Apache')
depends=('qt5-base' 'python-pbr' 'python-six' 'python-msgpack' 'python-pyopenssl' 'double-conversion')
source=("https://github.com/codilime/veles/releases/download/${pkgver}/Veles_${pkgver}_64bit_Ubuntu1604.deb")
sha256sums=('9954a384e6ba733b50e07b9fd2a32f0dd181ef8aab11ebd5441744020949357e')

package() {
	cd $srcdir
	tar xvf data.tar.gz
	cp -r usr $pkgdir
	tar xfv $pkgdir/usr/share/veles-server/veles-*.tar.gz
	_pypath="$(find . -type f -name setup.py -print -quit)"
	pushd "$(dirname $_pypath)"
	python setup.py build
	python setup.py install --prefix=$pkgdir/usr
	popd
}
