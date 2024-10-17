# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.34
pkgrel=2
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

sha256sums_x86_64=(48272e9034ff868d4328cf0055a07882fd2be93f59dfb6283af7de491f9d1290)
sha256sums_aarch64=(1a30771d85fa77f9ab8f18e63240f455ab3a3f87660ed7b8d5eea6ceecbe5c1e)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
