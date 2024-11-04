# Mantainer: Snaporaz
# Contributor: Andrea Pelloni <apelloni@ethz.ch>

pkgbase="python-symbolica"
pkgname=("python-symbolica")
pkgver=0.13.0
pkgrel=1
pkgdesc="Python library for woring with Symbolica, a fast and modern computer algebra system"
arch=('x86_64')
makedepends=()
license=('Custome')
url=https://github.com/benruijl/symbolica

_name=${pkgname#python-}
_cpy=cp37
_glibc=2_17
_wheel="${_name//-/_}-$pkgver-$_cpy-abi3-manylinux_${_glibc}_${arch}.manylinux2014_${arch}.whl"
source=("https://files.pythonhosted.org/packages/$_cpy/${_name::1}/$_name/$_wheel")

package() {
    cd $srcdir
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local _folder=$pkgdir/${site_packages%site-packages}
	wheel unpack --dest=$_folder $_wheel
    mv $_folder/$_name-$pkgver $_folder/site-packages
}

sha256sums=('8638378720f943255c66b0dae77a7131b27d761c7a7267ae7186f392d8802db6')
