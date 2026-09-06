# Maintainer: ZXY595 <zxy_595@qq.com>
pkgname=firefox-extension-listen1
pkgver=2.33.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("any")
url="https://listen1.github.io/listen1"
_githuburl="https://github.com/listen1/listen1_chrome_extension"
_name=${_githuburl##*/}
license=('MIT')
depends=("firefox")
makedepends=("zip")
source=("${_githuburl}/archive/refs/tags/v$pkgver.tar.gz"
	"fix-firefox.patch::https://github.com/listen1/listen1_chrome_extension/pull/1240.patch")
sha256sums=('e3e67e66475e80c539577561b71c78ef4314aaa622b73959c2b316c785068f1e'
            '4eb2388032e7220a18f3a22c9e28995fd91be91e3b303743dd4cbd7a9f914040')

prepare() {
    cd ${srcdir}/${_name}-${pkgver}
	# see also https://github.com/listen1/listen1_chrome_extension/issues/1235
	patch -Np1 -i "$srcdir/fix-firefox.patch"
    mv manifest_firefox.json manifest.json
}

build() {
    cd ${srcdir}/${_name}-${pkgver}
    zip -r ${srcdir}/githublisten1@gmail.com.xpi *
}

package() {
    install -Dm644 githublisten1@gmail.com.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/githublisten1@gmail.com.xpi
}
