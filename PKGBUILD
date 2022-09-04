# Maintainer: fuero <fuerob@gmail.com>
_pkgname=timew-sync-client
pkgname=${_pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc='Timewarrior Synchronization Client'
arch=('x86_64')
_repo_prefix='github.com/timewarrior-synchronize'
_repo_name="${_pkgname}"
url="https://${_repo_prefix}/${_repo_name}"
source=(
	${url}/archive/refs/tags/v${pkgver}.tar.gz
)
sha512sums=(
  '52e6247ad64c49fe0b8439c74d88c1d3106ae4fa12438120ddadd6673f7191a06ccaac05bc3a559ca45fdbbc71142dd8b35fc2bb4a12a9221f9a26092545303f'
)
license=('Apache')
depends=(
	python
	python-jwt
	python-jwcrypto
	python-six
	python-attrs
	python-pluggy
	python-iniconfig
	python-requests
	python-black
	python-colorama
)
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
checkdepends=(
	python-pytest
)
makedepends=(
	python-build python-installer python-wheel python-setuptools
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}
