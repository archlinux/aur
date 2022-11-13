# Maintainer: Rayr https://rayr.ml/LinkInBio/

pkgname=currencyconverter
pkgver=1.0.4
pkgrel=1
pkgdesc="A CLI program that converts currencies using currency exchange rates"
arch=('x86_64')
url="https://github.com/Rayrsn/currencyConverter"
license=('GPL')
makedepends=('go')
source=("https://github.com/Rayrsn/currencyConverter/archive/refs/tags/$pkgver.zip")
md5sums=('0f3dcf876d3240cead3f8a22a7ccf7f9')

# Go Flags https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

build() {
    cd "currencyConverter-$pkgver"
    go build
}

package() {
	cd "currencyConverter-$pkgver"
	install -Dm755 "currencyConverter" "$pkgdir/usr/bin/currencyConverter"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
