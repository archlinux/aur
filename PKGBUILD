# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=firefox-nutensor
_rev=9a577584259ee7ff9bace6f9631e2fc980f925f1
_assets_rev=4f087e49b8acd2cb2c273bb2aaad16e95f8275bf
pkgver=1.5.0b0.r1.${_rev:0:12}
pkgrel=2
pkgdesc="Point and click matrix to filter net requests by source, destination and type"
url="https://github.com/geekprojects/nuTensor"
arch=(any)
license=(GPL3)
groups=(firefox-addons)
depends=(firefox)
makedepends=(python zip)
source=(https://github.com/geekprojects/nuTensor/archive/${_rev}.tar.gz
		https://github.com/geekprojects/nuAssets/archive/${_assets_rev}.tar.gz)
sha256sums=('5222a69d1c6056f56e035ad25aad4c7c3eee18770be798d96936add1d26b6bb8'
            '1cb949d513206815c361839de7b75eb80b1d94228e688b91dc80a87de9e018e3')

prepare() {
	ln -sf nuAssets-${_assets_rev} nuAssets
}

build() {
	cd nuTensor-${_rev}

	tools/make-firefox.sh all
}

package() {
	cd nuTensor-${_rev}

	install -Dm0644 dist/build/nuTensor.firefox.xpi "${pkgdir}"/usr/lib/firefox/browser/extensions/nuTensor@geekprojects.com.xpi
}
