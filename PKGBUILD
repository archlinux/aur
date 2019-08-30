# Maintainer: Vasanth Developer <vasanth@vasanthdeveloper.com>
pkgname=samaya-git
_pkgname="samaya"
pkgver=cf3bd7d
pkgrel=1
pkgdesc="A time synchronization program that uses HTTP protocol"
url="https://github.com/vasanthdeveloper/samaya"
license=('GPL')
conflicts=('samaya')
provides=('samaya')
source=("samaya::git+https://github.com/vasanthdeveloper/samaya.git#branch=mainline")
md5sums=("SKIP")
depends=('systemd')
arch=(
    'i686'
    'x86_64'
)
makedepends=(
    'go'
    'make'
)
build() {
    if [ -d "$(go env GOPATH)/src/vasanthdeveloper.com/samaya" ]; then
        cd "$(go env GOPATH)/src/vasanthdeveloper.com/samaya" && git pull
    else
        mkdir -p "$(go env GOPATH)/src/vasanthdeveloper.com"
        git clone --single-branch --branch mainline https://github.com/vasanthdeveloper/samaya.git "$(go env GOPATH)/src/vasanthdeveloper.com/samaya"
    fi
    cd "$srcdir/samaya" && make
}
package() {
    cd "$srcdir/samaya" && make DESTDIR="$pkgdir" PREFIX=/usr install
}