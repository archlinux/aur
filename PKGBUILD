# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=python-pymupdf-layout-bin
_pypiname=pymupdf_layout
pkgver=1.28.0
pkgrel=1
pkgdesc='Layout analysis for PyMuPDF (binary wheel)'
arch=('x86_64' 'aarch64')
url='https://pymupdf.readthedocs.io/en/latest/pymupdf-layout/'
license=('custom:PolyForm-Noncommercial-1.0.0' 'custom:Artifex-Commercial')
depends=(
	"python-pymupdf=${pkgver}"
	'python-yaml'
	'python-numpy'
	'python-networkx'
	'python-onnxruntime'
)
makedepends=(
	'python-installer'
)
provides=("python-pymupdf-layout=${pkgver}")
conflicts=('python-pymupdf-layout')
_wheel_x86_64="${_pypiname}-${pkgver}-cp310-abi3-manylinux_2_28_x86_64.whl"
_wheel_aarch64="${_pypiname}-${pkgver}-cp310-abi3-manylinux_2_28_aarch64.whl"
source=("LICENSE.PolyForm-Noncommercial-1.0.0::https://polyformproject.org/licenses/noncommercial/1.0.0.txt")
source_x86_64=("${_wheel_x86_64}::https://files.pythonhosted.org/packages/56/3a/dc5ab8573300b0f1b7fb996aa33ce4683c27b190a8e8be6f18d80714183d/${_wheel_x86_64}")
source_aarch64=("${_wheel_aarch64}::https://files.pythonhosted.org/packages/0b/58/2607c539540ce261d05d2677c0d839b78a4191d328accc1d0e9385a06799/${_wheel_aarch64}")
noextract=("${_wheel_x86_64}" "${_wheel_aarch64}")
sha256sums=('ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8')
sha256sums_x86_64=('a6bd191301570a0863d6e04418324e823d0fd7f18b4fe1db2b9e53e715d2f8ff')
sha256sums_aarch64=('35b98e1ce9382709622e03c34b57d1b51a155ceb3d9122f11f8e9b2aa4f1ee55')

package() {
	local _wheel
	case "$CARCH" in
		x86_64)
			_wheel="${_wheel_x86_64}"
			;;
		aarch64)
			_wheel="${_wheel_aarch64}"
			;;
	esac
	python -m installer --destdir="$pkgdir" "$srcdir/${_wheel}"
	local _site_packages
	_site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -Dm644 LICENSE.PolyForm-Noncommercial-1.0.0 \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.PolyForm-Noncommercial-1.0.0"
	install -Dm644 "$pkgdir/${_site_packages#/}/${_pypiname}-${pkgver}.dist-info/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
