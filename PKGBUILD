# Source build of the official GitHub CLI
# Maintainer: Richard Bradfield <bradfier@fstab.me>

pkgname=github-cli
pkgver=0.5.4
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
    "eacf8dcc085e0a65a76bbc94b8501fd7c2b37e511dd2e24361c02e80e87ba642"
)

build() {
	cd "cli-$pkgver"
    go build -ldflags "-X github.com/cli/cli/command.Version=v${pkgver} -X github.com/cli/cli/command.BuildDate=$(date +%Y-%m-%d)" -o "bin/gh" ./cmd/gh
}

package() {
	cd "cli-$pkgver"
    install -Dm755 "${srcdir}/cli-${pkgver}/bin/gh" "${pkgdir}/usr/bin/gh"
    install -Dm644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/github-cli"
    install -Dm644 "${srcdir}/cli-${pkgver}/README.md" "${pkgdir}/usr/share/doc/github-cli/README.md"
}
