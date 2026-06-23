# Maintainer: Guru <anjanaya@gmail.com>
pkgname=glm-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="CLI tool to launch Claude Code with GLM (ChatGLM) settings via BigModel API"
arch=('x86_64' 'aarch64')
url="https://github.com/xqsit94/glm"
license=('MIT')
provides=('glm')
conflicts=('glm')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/xqsit94/glm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}::https://github.com/xqsit94/glm/releases/download/v${pkgver}/glm-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/xqsit94/glm/releases/download/v${pkgver}/glm-linux-arm64")
sha256sums=('138a4aef89fcd56fde8126e690a13378c174e21721ff1524560dd853b09cc670')
sha256sums_x86_64=('6cdb295158569bb99750c1a895748bddb6028d8d48d2f0a4e7bbbe3ace946d18')
sha256sums_aarch64=('1412633ae36ee1f6e85f4e7ea3bbde85928ee6ad9b9ea037eb54f4f57990e9cd')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/glm"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/glm" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/glm"
    "${pkgdir}/usr/bin/glm" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_glm"
    "${pkgdir}/usr/bin/glm" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/glm.fish"
}