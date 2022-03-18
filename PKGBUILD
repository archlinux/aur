# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-cli-git
pkgver=v1.6.0.r115.gafffb5f
pkgrel=1
pkgdesc='Outscale CLI'

arch=('any')
url='https://github.com/outscale/osc-cli'
license=(BSD)

pkgver() {
  cd "${srcdir}/osc-cli"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

makedepends=('python-setuptools')
depends=(python-fire python-requests python-xmltodict)

source=("git+https://github.com/outscale/osc-cli.git")
sha256sums=("SKIP")

build() {
	cd "${srcdir}/osc-cli"
	python ./setup.py build
}

package() {
	cd "${srcdir}/osc-cli"
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D "${srcdir}/osc-cli/LICENSE" "$pkgdir/usr/share/licenses/osc-cli/LICENSE"
}
