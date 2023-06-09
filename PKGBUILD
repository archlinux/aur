# Contributor: navigaid <navigaid@gmail.com>

pkgname=gopherjs
pkgdesc="A compiler from Go to JavaScript for running Go code in a browser"
pkgver=1.18.0_beta2
_go=1.18.5
url="https://github.com/gopherjs/gopherjs"
license=(BSD2)
depends=(glibc)
pkgrel=1
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gopherjs/gopherjs/archive/refs/tags/v${pkgver/_/-}+go${_go}.tar.gz")
makedepends=('go')
md5sums=('c38febaefce9db41702692ded304bd38')

build() {
	for f in *; do
		if [ -d "$f" ]; then
			pushd "$f"
			go build .
		fi
	done
}

package() {
	find . -executable -name gopherjs -exec install -Dm755 {} -t ${pkgdir}/usr/bin/ \;
	find . -name LICENSE -exec install -Dm644 {} -t ${pkgdir}/usr/share/licenses/$pkgname \;
}
