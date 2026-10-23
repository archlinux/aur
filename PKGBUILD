# Maintainer: Will Handley <wh260@cam.ac.uk>

# NVIDIA's CuTe DSL (the `cutlass` Python module, pinned by SGLang as
# nvidia-cutlass-dsl[cu13]). NVIDIA publishes it only as wheels: this
# metapackage installs the path file that puts the DSL on sys.path and
# pulls in the CUDA 13 build. Upstream's metadata also requires the CUDA 12
# build unconditionally; it is not packaged, so `pip check` reports it.
pkgname=python-nvidia-cutlass-dsl
_pypi=nvidia_cutlass_dsl
pkgver=4.8.0
pkgrel=1
pkgdesc='NVIDIA CuTe DSL (the cutlass Python module), CUDA 13 build'
arch=('any')
url='https://pypi.org/project/nvidia-cutlass-dsl/'
license=('LicenseRef-NVIDIA-Software-License-Agreement')
depends=('python' "python-nvidia-cutlass-dsl-libs-base=${pkgver}" "python-nvidia-cutlass-dsl-libs-cu13=${pkgver}")
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/e4/f4/e96f452f7975dd2fd4d2a4af88c63205431dad7efbe63aff6e3a4b1ada17/${_pypi}-${pkgver}-py3-none-any.whl")
noextract=("${source[0]##*/}")
sha256sums=('24f996e0e5fa88c8b417f4893e615af135bdfdfdbdbed7e239faf36a88df711b')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/${source[0]##*/}"
  install -Dm644 "$(find "$pkgdir" -path "*/${_pypi}-${pkgver}.dist-info/licenses/LICENSE")" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
