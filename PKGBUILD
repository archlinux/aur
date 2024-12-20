# Maintainer: Neurognostic <neurognostic@astranetics.com>
# Contributor: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
_name=${pkgname#python-}
_pep625_name=${_name//-/_}
pkgver=0.7.8
pkgrel=1
pkgdesc='Yet another Discord overlay for Linux written in Python using GTK3'
arch=('x86_64')
url='https://github.com/trigg/Discover'
license=('GPL3')
makedepends=(
	'python-build'
	'python-wheel'
	'python-installer'
)
depends=(
	'gtk3'
	'libappindicator-gtk3'
	'python-gobject'
	'python-pyxdg'
	'python-requests'
	'python-websocket-client'
	'python-cairo'
	'python-pillow'
	'python-xlib'
	'python-setuptools'
	'python-pulsectl-asyncio'
)
optdepends=('gtk-layer-shell: Wayland support')
# Since discover-overlay==0.7.4 package name follow PEP-625,
# as result `-` (hyphen) should be replaced by `_` (underscore) in distribution sdist file.
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_pep625_name}-$pkgver.tar.gz")
sha512sums=('623e83d40e5f5dd0e0657c5052af9ab930d2015afa924c4c1276f3fb5897cef92e56d18bdf1c8ae867da6a4e6d96607971b9f43767c00fef120c88f3d484164a')

build() {
	cd ${_pep625_name}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pep625_name}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
