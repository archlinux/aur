# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributer: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=lux-dl
pkgver=0.17.2
pkgrel=1
pkgdesc="Fast and simple video download library and CLI tool written in Go"
arch=('x86_64' 'i686')
url="https://github.com/iawia002/lux"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
conflicts=('annie')
replaces=('annie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eaf08b8cdac14504307ae31920d3d094101d901cd390436ca401b3ba1e7a8924')

build(){
    cd lux-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external"
}

package() {
    cd lux-$pkgver
    install -Dm755 lux -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
