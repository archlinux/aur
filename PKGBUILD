# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fake-bpy-module-latest
_name=${pkgname#python-}
_pkgver=$(date -d "yesterday" '+%Y%m%d')
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Collection of the fake Blender Python API module for the code completion."
arch=('x86_64')
url="https://github.com/nutti/fake-bpy-module"
license=('MIT')
groups=()
depends=()
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=('python-fake-bpy-module-latest')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz LICENSE)
noextract=()
md5sums=('SKIP'
         'SKIP')

build() {
	cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}
