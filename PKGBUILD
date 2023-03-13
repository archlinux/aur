# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=eugenesiow/super-image
_source_type=pypi-releases
_upstreamver='0.1.7'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="State-of-the-art image super resolution models for PyTorch"
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-torchvision python-opencv python-h5py python-tqdm python-huggingface-hub)
license=(Apache)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('e4344f6f080a4569ae88bbf8b13c6b4876df0911dbe57234a5154e4b0a3a0879')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
