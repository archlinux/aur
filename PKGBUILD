_module='samplerate'
pkgname=python-$_module
_src_folder='samplerate-0.2.1'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Monolithic python wrapper for libsamplerate based on pybind11 and NumPy"
url=""
depends=('python' 'libsndfile')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/bf/9c/d8978b13b8af2f28fdc425e2893f7419d1d6429da1c6a850be83ad095d4f/samplerate-0.2.1.tar.gz")
sha256sums=('464d3574412024184fb7428ecbaa1b2e207bddf5fbc10a5d9ddc3fc1c7b7ab1e')

build() {
    cd "${srcdir}/${_src_folder}"
    SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" \
    CMAKE_ARGS="-DCMAKE_POLICY_VERSION_MINIMUM=3.5" \
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
