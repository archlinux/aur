# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=lux-go-git
pkgver=0.12.0.r4.gbfc1b1d
pkgrel=1
arch=('x86_64')
pkgdesc="Fast and simple video download library and CLI tool written in Go "
url="https://github.com/iawia002/lux"
license=('MIT')
makedepends=('go')
depends=('ffmpeg')
conflicts=('lux-go')
provides=('lux-go')
source=("git+https://github.com/iawia002/lux.git")
sha256sums=('SKIP')

pkgver() {
  cd lux
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
  # Upstream adds a 'v' in its version since 0.11
}

build(){
    cd lux

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
    cd lux
    install -Dm755 lux "$pkgdir/usr/bin/lux-go"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
