# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=annie-git
pkgver=0.11.0.r20.g8b53403
pkgrel=1
arch=('x86_64')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=('MIT')
makedepends=('go')
depends=('ffmpeg')
conflicts=('annie')
provides=('annie')
source=("git+https://github.com/iawia002/annie.git")
sha256sums=('SKIP')

pkgver() {
  cd annie
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
  # Upstream adds a 'v' in its version since 0.11
}

build(){
    cd annie

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
    cd annie
    install -Dm755 annie -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
