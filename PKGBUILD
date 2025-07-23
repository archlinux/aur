# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='XLA library for JAX - binary package'
arch=('x86_64' 'aarch64')
url="https://github.com/google/jax"
license=('Apache')
provides=(python-jaxlib=${pkgver})
conflicts=(python-jaxlib)
depends=('python-ml-dtypes>=0.2.0'
         'python-numpy>=1.24'
         'python-scipy>=1.10' # requiring >=1.11.1 for python 3.12
	 )
makedepends=('python-installer' 'python-wheel')

_py="cp$(python -c 'from sys import version_info as vi; print(f"{vi.major}{vi.minor}")')"
_whl=${_name//-/_}-$pkgver-$_py-${_py}-manylinux2014_$CARCH.whl

source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_whl}")
source_aarch64=(${source_x86_64[@]//x86_64/aarch64}) # require substitution for correct .SRCINFO generation on x86_64

sha256sums_x86_64=(df31664a53c13a9263bca0e8c39e0380a0ccae0b1c125376df63a480d9cb2087)
sha256sums_aarch64=(5b7393c8694a17ed522e9553e06791dd76b4789b3448d085d0ed4ffbad77a2e7)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
