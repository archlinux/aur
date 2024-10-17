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
depends=('python-absl'
         'python-flatbuffers'
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('python-installer' 'python-wheel')

_py=cp312
_whl=${_name//-/_}-$pkgver-$_py-${_py}-manylinux2014_$CARCH.whl

source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_whl}")
source_aarch64=(${source_x86_64[@]}) # _whl already CARCH specific, no need to change

sha256sums_x86_64=(48272e9034ff868d4328cf0055a07882fd2be93f59dfb6283af7de491f9d1290)
sha256sums_aarch64=(1a30771d85fa77f9ab8f18e63240f455ab3a3f87660ed7b8d5eea6ceecbe5c1e)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
