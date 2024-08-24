# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Nasado <hi at nasado dot name>
# Contributor: Michael Duell <mail at akurei ddot me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>

_pkgauthor=rfjakob
_name=gocryptfs
pkgname=gocryptfs-git
pkgver=2.4.0.r37.gf665be1
pkgrel=1
pkgdesc='Encrypted overlay filesystem written in Go (git snapshot)'
arch=('i686' 'x86_64')
url="https://github.com/${_pkgauthor}/${_name}"
license=('MIT')
depends=('glibc' 'openssl' 'fuse3')
makedepends=('git' 'go' 'pandoc' 'man-db')
provides=('gocryptfs')
conflicts=('gocryptfs')
source=(git+${url})
sha256sums=('SKIP')


pkgver() {
    cd ${_name}
    git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd ${_name}

    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=mod"
    make build
}

package() {
    cd ${_name}
    make DESTDIR="${pkgdir}" install
}
