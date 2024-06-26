# Mantainer: Snaporaz
# Contributor: Andrea Pelloni <apelloni@ethz.ch>

pkgbase="python-symbolica"
pkgname=("python-symbolica")
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for woring with Symbolica, a fast and modern computer algebra system"
arch=('x86_64')
makedepends=()
license=('Custome')
url=https://github.com/benruijl/symbolica

_name=${pkgname#python-}
_py=cp37
_wheel="${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_34_x86_64.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_wheel")

package() {
    cd $srcdir
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local _folder=$pkgdir/${site_packages%site-packages}
	wheel unpack --dest=$_folder $_wheel
    mv $_folder/$_name-$pkgver $_folder/site-packages
}

sha256sums=('4fbadb3aef26305768246305e79f77751be9fdb9df6a63cc4cb856de09126399')
