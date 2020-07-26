# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='torchac'
_reponame='L3C-PyTorch'
pkgname="python-pytorch-${_name}"
pkgver=3
pkgrel=1
pkgdesc="Fast Entropy Coding in PyTorch"
url="https://github.com/trougnouf/${_reponame}"
# fab-jul
depends=('python-pytorch')
makedepends=('python-setuptools')
license=('GPL3')
arch=('x86_64')

source=("git+${url}.git")
#tag=v${pkgver}")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_reponame}/src/${_name}"
	COMPILE_CUDA=auto python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}/src/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cp "${srcdir}/${_reponame}/src/${_name}/${_name}.py" "${pkgdir}${site_packages}/"
}

