# Maintainer: WildboarG, mm62633482@gmail.com
_pkgname=fscan
pkgname=${_pkgname}-git
pkgver=1.8.2 
pkgrel=2
pkgdesc="Intranet scanning tool"
arch=('any')
url="https://github.com/shadow1ng/fscan"
license=('MIT')
provides=('fscan')
conflicts=('fscan')
makedepends=('git' 'go' 'upx')
depends=()
source=(
	"git+${url}.git"
)
sha256sums=('SKIP')

build() {
	cd "${_pkgname}"
	export GO111MODULE=on
    export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
    go mod tidy
	go build -ldflags="-s -w " -o build .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
}
