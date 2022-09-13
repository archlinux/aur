# Maintainer: Rayr https://rayr.ml/LinkInBio/

pkgname=weather-cli
pkgver=1.2.2
pkgrel=2
pkgdesc="An app made to get weather information through the terminal written in Go"
arch=('x86_64')
url="https://github.com/Rayrsn/Weather-Cli"
license=('GPL')
makedepends=('go')
source=("https://github.com/Rayrsn/Weather-Cli/archive/refs/tags/$pkgver.zip")
md5sums=('c527ccfa94eae146d593ed69febf8f66')

# Go Flags https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

build() {
    cd "Weather-Cli-$pkgver"
    go build
}

package() {
	cd "Weather-Cli-$pkgver"
	install -Dm755 "weather-Cli" "$pkgdir/usr/bin/weather-Cli"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
