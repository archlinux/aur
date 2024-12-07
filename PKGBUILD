# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=jaxlib
pkgname=python-${_name,,}-bin
pkgver=0.4.36
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

sha256sums_x86_64=(be295abc209c980817db0488f21f1fbc0644f87326522895e2b9b64729106357)
sha256sums_aarch64=(fbbabaa287378a78a3cf9cbe4de30a1f6f19a99116feb4bd687ff256415cd442)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
