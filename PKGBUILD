# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=8.6.0
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/camunda-community-hub/zeebe-client-go"
license=('Apache-2.0')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/camunda-community-hub/zeebe-client-go/releases/download/v$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
b2sums=('84382e45bbdad0d7c045cca5d8934d1e0227c32e762bd8a1261acc04bdcff7c9a12dab00c32f7d0733003168720696992685fc0ce170ac3423bb4a153534d5d7')

build() {
	chmod +x "${srcdir}/${pkgname}-${pkgver}"
	"${srcdir}/${pkgname}-${pkgver}" completion bash >"${srcdir}/${pkgname}.bash"
	"${srcdir}/${pkgname}-${pkgver}" completion zsh >"${srcdir}/${pkgname}.zsh"
	"${srcdir}/${pkgname}-${pkgver}" completion fish >"${srcdir}/${pkgname}.fish"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

    # bash
    mkdir -p "${pkgdir}/usr/share/bash-completion"
    install -Dm644 "${srcdir}/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

    # zsh
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm644 "${srcdir}/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    # fish
    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm644 "${srcdir}/${pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
