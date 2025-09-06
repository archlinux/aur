# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>
# Contributor: csantosb <csantosb dot inventati dot org>

pkgname=python-vsg
pkgver=3.34.0
pkgrel=1
pkgdesc="VHDL style guide: coding style enforcement for VHDL"
arch=('any')
url="https://github.com/jeremiah-c-leary/vhdl-style-guide/"
license=('GPLv3')
conflicts=('python-vsg-git')
provides=('python-vsg')
depends=('python' 'python-pyaml')

makedepends=('git' 'python-setuptools-git-versioning' 'python-setuptools')

options=(!emptydirs)
source=("git+https://github.com/jeremiah-c-leary/vhdl-style-guide#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/vhdl-style-guide"
    rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/vhdl-style-guide"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
