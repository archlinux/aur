# Maintainer: kamisaki
# Description: 🚀🌠 A minimal, fast, and customizable prompt written in Go
pkgname=pulsarship
pkgver=0.2.2
pkgrel=1
pkgdesc="🚀🌠 A minimal, fast, and customizable prompt written in Go"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/xeyossr/pulsarship"
license=('GPL3')
depends=()
makedepends=('go' 'git')

source=(
    "git+https://github.com/xeyossr/pulsarship.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"

    # Fetch version, tag, commit, build time, and build environment dynamically
    TAG=$(git describe --tags)
    COMMIT=$(git rev-parse --short HEAD)
    BUILDTIME=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    BUILDENV=$(go version)

    LDFLAGS="-X main.version=${pkgver} -X main.tag=${TAG} -X main.commit=${COMMIT} -X main.buildTime=${BUILDTIME} -X main.buildEnv=${BUILDENV}"

    # Build the binary with dynamic LDFLAGS
    go mod tidy
    go build -ldflags "${LDFLAGS}" -o pulsarship
}

package() {
    cd "$srcdir/${pkgname}"
    # Install the binary to /usr/bin/
    install -Dm755 "${srcdir}/${pkgname}/pulsarship" "${pkgdir}/usr/bin/${pkgname}"
}
