# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Étienne André <eti.andre@gmail.com>

pkgname='python-fusepy'
_module=${pkgname#python-}
pkgver=3.0.1
pkgrel=7
pkgdesc='Simple ctypes bindings for FUSE (no active development)'
url='https://github.com/fusepy/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse2>=2.6' 'python>=3.11')
makedepends=('python-setuptools')
conflicts=('python-fuse')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
b2sums=('c76319b0d0b64a8dc674b803551f32352fed9a1e6e050110963a159259c3fed8fefbb63cfe6dda689738f07cb796c6b9da14e3070c4a1cf5b70892a6ebe52cc2')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build

	sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
