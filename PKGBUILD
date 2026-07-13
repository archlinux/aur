# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=phasionary-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Terminal-first, single-user project planning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/phasionary"
license=('MIT')
depends=('glibc')
provides=('phasionary')
conflicts=('phasionary')
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/phasionary-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/phasionary-linux-arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('5d356c9674dec609335c623b994cc9ae600a043d0f7f4d0d76d455e5f78d337e')
sha256sums_aarch64=('767fa4d920c6352d794364701bdf670386c8420d9d937c71ffaffc4260e957f3')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/phasionary"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/phasionary" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/phasionary"
    "${pkgdir}/usr/bin/phasionary" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_phasionary"
    "${pkgdir}/usr/bin/phasionary" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/phasionary.fish"
}
