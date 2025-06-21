# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname=jumpcutter
pkgname="python-${_pkgname}"

pkgdesc="Jumpcut silent parts of your videos automagically"

pkgver=0.1.6
pkgrel=3

arch=(any)

url="https://github.com/emkademy/${_pkgname}"
license=(MIT)

depends=("python-moviepy<2.0.0" python-tqdm)
makedepends=(python-build python-installer python-wheel python-poetry-core)

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=(375c45a6fa9e6a8aec0594699ccf8722)

build() {
	# move to the source directory
	cd "${_pkgname}-${pkgver}"

	# build the package
	python -m build --wheel --no-isolation
}

package() {
	# move to the source directory
	cd "${_pkgname}-${pkgver}"

	# copy the files over to the package directory
	python -m installer --destdir="${pkgdir}" dist/*.whl

	# bundle the license and docs inside the package
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}