# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=8.3.3
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/go/cmd/zbctl"
license=('Apache')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
b2sums=('a2f4d1a8faea2369f845dd3272e478a64ad76a66b4186ddd18f3b36da7def036d1e0621f8a874250b41797a065bfd2c56c6f8ba029db81dd5da0760adfa64dee')

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
