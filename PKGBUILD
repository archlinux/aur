# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pymunk
pkgname=python-$_name
pkgver=7.2.0
pkgrel=1
pkgdesc='Pymunk is a easy-to-use pythonic 2D physics library.'
arch=('any')
url='https://github.com/viblo/pymunk'
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-cffi' 'cmake' 'gcc')
checkdepends=('python-pyglet' 'python-pygame' 'python-pillow' 'python-aafigure' 'python-matplotlib' 'python-numpy')
optdepends=('python-pyglet' 'python-pygame' 'python-pillow' 'python-aafigure' 'python-matplotlib' 'python-numpy')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
				"https://github.com/viblo/Munk2D/archive/refs/tags/2.0.1.tar.gz")
sha256sums=('653f7ae05711b885a48b84004721bde165f119d51365d12efbffb717c1920e21'
						'622fd376e95d3adf49ff8681081ec6b4cc6b082649164633ae4ce7b86c9cce93')

prepare(){
	cd "$srcdir"
	rm -rf "$srcdir"/$_name-$pkgver/Munk2D
	mv Munk2D-2.0.1 "$srcdir"/$_name-$pkgver/Munk2D
}

build(){
	cd "$srcdir"/$_name-$pkgver
	python -m build --wheel --no-isolation
}


check(){
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$srcdir"/$_name-$pkgver/build/lib.linux-$CARCH-cpython-$python_version
  python -m pymunk.tests
}

package(){
	cd "$srcdir"/$_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
