# Maintainer: kumax <kumax2048@pm.me>
pkgname=firefox-extension-gooreplacer
pkgver=3.13.0
pkgrel=2
pkgdesc="A browser extension to modify HTTP requests"
arch=("any")
url="https://liujiacai.net/gooreplacer/"
_githuburl="https://github.com/jiacai2050/gooreplacer"
_name=${_githuburl##*/}
license=('MIT')
depends=("firefox")
makedepends=("zip")
source=("${_githuburl}/releases/download/v$pkgver/firefox_gooreplacer_1653621114.zip")
sha256sums=('82a24ee0bbbdd409e606787abcd9b80ab6d96b462a2d78744d79e500770584a9')

prepare() {
    sed -i '1a\
  \"applications\": {\
    \"gecko\": {\
      \"id\": \"gooreplacer@liujiacai.net\",\
      \"strict_min_version\": \"45.0\"\
    }\
  },' manifest.json
}

build() {
    zip -r ${srcdir}/gooreplacer@liujiacai.net.xpi *
}

package() {
    install -Dm644 gooreplacer@liujiacai.net.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/gooreplacer@liujiacai.net.xpi
}
