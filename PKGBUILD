# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>

pkgname=python-buildozer
_pkgname=buildozer
pkgver=1.6.0
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
url="https://github.com/kivy/buildozer"
depends=(
	'python'
	'python-colorama'
	'python-pexpect'
	'python-virtualenv'
	'python-packaging'
	'python-sh'
)
makedepends=(
	'cmake'
	'libusb'
	'python-build'
	'python-installer'
	'python-setuptools'
)
optdepends=('python-paramiko: remote builds')
license=('MIT')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('43ccfefdced4bc0a5abe1dd40335d86830bce66d04ce8bbd91fe12760b80ec69')
provides=('buildozer' 'python-buildozer')
conflicts=('buildozer')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
