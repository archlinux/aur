# Maintainer: Nikolay Arhipov <n at arhipov dot net>
pkgname=env-secrets-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A CLI tool to set env variables with secrets in shell from the secret-service"
arch=('x86_64' 'aarch64')
url="https://github.com/nikarh/env-secrets"
license=('MIT')
provides=('env-secrets')
conflicts=('env-secrets')
makedepends=('curl' 'grep' 'awk')

source=(
	"env-secrets-${arch}-unknown-linux-gnu-v${pkgver}.tar.gz::https://github.com/nikarh/env-secrets/releases/download/v${pkgver}/env-secrets-${arch}-unknown-linux-gnu-v${pkgver}.tar.gz"
)

sha256sums=('32c3acf20fd4eeff17bce19729db3ccf152590c5e6d7a99b4ac5fc164e050349')

pkgver() {
    curl --silent "https://api.github.com/repos/nikarh/env-secrets/releases/latest" | grep tag_name | head -n 1 | awk -F'"' '{print $4}' | awk -F'v' '{print $2}'
}

package() {
	install -Dm755 "${srcdir}/env-secrets" "${pkgdir}/usr/bin/env-secrets"
	install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

