# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname=python-pymupdf-layout-bin
_pypiname=pymupdf_layout
pkgver=1.27.2.3
pkgrel=1
pkgdesc='Layout analysis for PyMuPDF (binary wheel)'
arch=('x86_64' 'aarch64')
url='https://pymupdf.readthedocs.io/en/latest/pymupdf-layout/'
license=('custom:PolyForm-Noncommercial-1.0.0' 'custom:Artifex-Commercial')
depends=(
	'python-pymupdf=1.27.2.3'
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
source_x86_64=("${_wheel_x86_64}::https://files.pythonhosted.org/packages/32/e9/7ce6eaf97cebd46c3808593282e9eb99a60cddd6183e25a636980d5c7986/${_wheel_x86_64}")
source_aarch64=("${_wheel_aarch64}::https://files.pythonhosted.org/packages/84/87/bfdcca67346052943a4549814f2009b38f4d15ec025798cdf7dfa5f57c84/${_wheel_aarch64}")
noextract=("${_wheel_x86_64}" "${_wheel_aarch64}")
sha256sums=('ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8')
sha256sums_x86_64=('303b9414216dfaf711ec7d807b6f1e4c3e0a92bbb4569340fcedd9d5593d16ca')
sha256sums_aarch64=('fcf03aa815cbceebdb3263dd6a190de4547c46b1d168928836ec38738afe127d')

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
