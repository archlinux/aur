# Maintainer: 3DA4C300 <3DA4C300@protonmail.com>

pkgname=safecoin-git
pkgver=0.28
pkgrel=1
pkgdesc="Safecoin daemon & client"
arch=("x86_64")
url="https://safecoin.org/"
license=('MIT')
makedepends=("git" "wget")
conflicts=("safecoin")
provides=("safecoin")
source=("git://github.com/Fair-Exchange/safecoin")
md5sums=("SKIP")

pkgver() {
  cd "safecoin"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "safecoin"
	./zcutil/fetch-params.sh
	./zcutil/build.sh
}

package() {
	cd "safecoin"
	install -Dm755 src/safecoin-cli "${pkgdir}/usr/bin/safecoin-cli"
	install -Dm755 src/safecoind "${pkgdir}/usr/bin/safecoind"
}
