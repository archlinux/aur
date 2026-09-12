# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=python-pymupdf-layout-bin
_pypiname=pymupdf_layout
pkgver=1.28.2
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
	'python-onnxruntime-cpu'
)
makedepends=(
	'python-installer'
)
provides=("python-pymupdf-layout=${pkgver}")
conflicts=('python-pymupdf-layout')
_wheel_x86_64="${_pypiname}-${pkgver}-cp310-abi3-manylinux_2_28_x86_64.whl"
_wheel_aarch64="${_pypiname}-${pkgver}-cp310-abi3-manylinux_2_28_aarch64.whl"
source=("LICENSE.PolyForm-Noncommercial-1.0.0::https://polyformproject.org/licenses/noncommercial/1.0.0.txt")
source_x86_64=("${_wheel_x86_64}::https://files.pythonhosted.org/packages/03/65/6b92d25678c64839fb2066ee98d6d1f164d820ba045d83c77e79021cda98/${_wheel_x86_64}")
source_aarch64=("${_wheel_aarch64}::https://files.pythonhosted.org/packages/75/82/6cbf0331e148db48bf609c165dbe900cf3c1158546c5d09d4ad7fd4d6b17/${_wheel_aarch64}")
noextract=("${_wheel_x86_64}" "${_wheel_aarch64}")
sha256sums=('ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8')
sha256sums_x86_64=('4b44a1d8ebf897b0e862ee2d73e7df73099f1c047fc024d2dd24ef0632d2cb5f')
sha256sums_aarch64=('fc7716682bfde26c002a7309cda0c520f3d2466dce368054d4fc2b653a74e8bc')

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
