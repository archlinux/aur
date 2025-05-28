# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.6.1
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

sha256sums_x86_64=(e734be70fe3e1fa2a31415362721189d974d10a66b0f5396c84585587d101b15)
sha256sums_aarch64=(d0c343c51b1052593edb603ddf58cf7f98812b2951ae6c45bd6e93e3e1f2f621)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
