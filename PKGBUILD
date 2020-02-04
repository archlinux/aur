# Source build of the official GitHub CLI
# Maintainer: Richard Bradfield <bradfier@fstab.me>

pkgname=github-cli
pkgver=0.5.3
pkgrel=1
pkgdesc="The GitHub CLI"
arch=("any")
url="https://github.com/cli/cli"
license=("MIT")
depends=("glibc")
makedepends=("glibc" "go")
optdepends=("git: To interact with repositories")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cli/cli/archive/v${pkgver}.tar.gz")
sha256sums=(
    "250ce6ac8b0a28a16585900e663d533b4858c6d98572fc4083f5cedcb57538fe"
)

build() {
	cd "cli-$pkgver"
    go build -ldflags "-X github.com/cli/cli/command.Version=v${pkgver} -X github.com/cli/cli/command.BuildDate=$(date +%Y-%m-%d)" -o "bin/gh" ./cmd/gh
}

package() {
	cd "cli-$pkgver"
    install -Dm755 "${srcdir}/cli-${pkgver}/bin/gh" "${pkgdir}/usr/bin/gh"
    install -Dm644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/github-cli"
}
