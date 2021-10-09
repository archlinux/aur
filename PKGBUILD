# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=veles
pkgver=2018.05
pkgrel=1
pkgdesc='Binary data analysis and visualization tool'
arch=('x86_64')
url="https://codisec.com/veles/"
license=('Apache')
depends=('qt5-base' 'python-pbr' 'python-six' 'python-msgpack' 'python-pyopenssl' 'double-conversion')
source=("https://github.com/codilime/veles/releases/download/${pkgver}.0.TIF/Veles_${pkgver}_64bit_Ubuntu1604.deb")
sha256sums=('cb20661606d60077666c74935b94c5f0b133426a776ba7a58513abdcf44f402c')

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
