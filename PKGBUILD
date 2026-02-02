_module='flux-led'
pkgname=python-$_module
_src_folder='flux_led-1.2.0'
pkgver='1.2.0'
pkgrel=1
pkgdesc="A utility for controlling Flux WiFi Smart LED Light Bulbs"
url=""
depends=('python')
#makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
makedepends=('python-build' 'python-setuptools' 'python-pytest-runner')
license=('LGPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/flux_led/flux_led-1.2.0.tar.gz")
sha256sums=('3cfb68df243bdc9bdde6a91e9d05960949de70b8a76fdb799b70021c54380c3d')

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
