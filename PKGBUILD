# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=librespeed-cli
pkgname="${_pkgname}-git"
pkgver=1.0.12.r0.g14717ac
pkgrel=1
pkgdesc='Command line client for LibreSpeed, Git version'
arch=(x86_64 aarch64 armv6h armv7h)
url=https://github.com/librespeed/speedtest-cli
license=(LGPL-3.0-only)
makedepends=(git go)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    bash build.sh "$pkgver"
}

package() {
    cd "$_pkgname"
    install -Dm755 "out/${_pkgname}-$(go env GOOS)-$(go env GOARCH)" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}
