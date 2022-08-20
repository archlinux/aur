# Maintainer: WildboarG, mm62633482@gmail.com
_pkgname=fscan
pkgname=${_pkgname}-git
pkgver=1.8.1
pkgrel=1
pkgdesc="Intranet scanning tool"
arch=('any')
url="https://github.com/shadow1ng/fscan"
license=('MIT')
provides=('fscan')
conflicts=('fscan')
makedepends=('git' 'go')
depends=()
source=(
	"git+${url}.git"
)
sha256sums=('SKIP')

build() {
	cd "${_pkgname}"
	export GO111MODULE=on
    export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
	go build -ldflags="-s -w " -trimpath main.go
}

package() {
	cd "${_pkgname}"
	mv main fscan
	install -Dm755 $srcdir/fscan/fscan  -t "${pkgdir}"/usr/bin/
}
