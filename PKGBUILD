# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Stella <jens300304 at gmail dot com>

pkgname=python-osrparse
_name=${pkgname#python-}

pkgdesc="Parser for .osr (osu! replays) file format"

pkgver=7.0.1
pkgrel=1

arch=(any)

url="https://pypi.org/project/osrparse/"
license=("MIT")

depends=(python)
makedepends=(python-build python-installer python-wheel)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=("e4fb884710ceb253028708fea9fc5761")

build() {
	# move to the source directory
	cd "${_name}-${pkgver}"

	# build the package
	python -m build --wheel --no-isolation
}

package() {
	# move to the source directory
	cd "${_name}-${pkgver}"

	# package the files
	python -m installer --destdir="${pkgdir}" dist/*.whl

	# bundle the license in the package
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
