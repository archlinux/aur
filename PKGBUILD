# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=bws-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=("aarch64" "x86_64")
url="https://bitwarden.com/"
_get_license="$(mkdir -p src && curl -sL "https://raw.githubusercontent.com/bitwarden/sdk/master/LICENSE" -o src/LICENSE)"
_shasums="$(curl -sL https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-sha256-checksums-${pkgver//_/-}.txt)"
license=("custom:BITWARDEN SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-aarch64-unknown-linux-gnu-${pkgver}.zip")
source_x86_64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-x86_64-unknown-linux-gnu-${pkgver}.zip")
sha256sums_aarch64=($(echo "$_shasums"  | awk '{print $1,$2}' | grep bws-aarch64-unknown-linux-gnu-${pkgver}.zip | awk '{print $1}'))
sha256sums_x86_64=($(echo "$_shasums" | awk '{print $1,$2}' | grep bws-x86_64-unknown-linux-gnu-${pkgver}.zip | awk '{print $1}'))

package() {
    install -Dm755 bws "${pkgdir}/usr/bin/bws"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
