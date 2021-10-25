# Maintainer:  Michael Connor Buchan <mikey@blindcomputing.org>
pkgname=tomlc99-git
pkgver=r136.208203a
pkgrel=1
pkgdesc="TOML C library"
arch=("$CARCH")
url="https://github.com/cktan/tomlc99"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
    # Currently broken due to deprecation in go, see https://golang.org/doc/go-get-install-deprecation
#checkdepends=('go' 'jq')
checkdepends=('jq')
provides=("${pkgname%-git}" 'libtoml.so')
conflicts=("${pkgname%-git}")
install=
source=("git+https://github.com/cktan/${pkgname%-git}.git")
cksums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        make
}

check() {
    # Currently broken due to deprecation in go, see https://golang.org/doc/go-get-install-deprecation
	#cd "$srcdir/${pkgname%-git}/test1"
        #bash build.sh
        #bash run.sh
	cd "$srcdir/${pkgname%-git}/test2"
        bash build.sh
        bash run.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make prefix="$pkgdir/usr" install
        chmod 644 "$pkgdir/usr/lib/libtoml.a"
        install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
