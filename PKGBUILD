# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=schemahero-bin
pkgver=0.26.1
pkgrel=1
pkgdesc='Declarative database schema management as code (CNCF)'
arch=('x86_64' 'aarch64')
url='https://github.com/schemahero/schemahero'
license=('Apache-2.0')
provides=('schemahero')
conflicts=('schemahero')
source_x86_64=("schemahero-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_amd64.tar.gz")
source_aarch64=("schemahero-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_arm64.tar.gz")
sha256sums_x86_64=('3064e17f2ea015f2dc8153c77c16fe1424a0f42eb7fe07dc4ee4be1f67af93fa')
sha256sums_aarch64=('a6306916137c47184e6b80654e8c60aa7bba3e59c1da45bd0ef1380024efd705')

package() {
    install -Dm755 schemahero -t "${pkgdir}/usr/bin/"
    ln -s schemahero "${pkgdir}/usr/bin/kubectl-schemahero"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

    for shell in bash zsh fish; do
        ./schemahero completion "$shell" > "schemahero.$shell"
    done
    install -Dm644 schemahero.bash "${pkgdir}/usr/share/bash-completion/completions/schemahero"
    install -Dm644 schemahero.zsh "${pkgdir}/usr/share/zsh/site-functions/_schemahero"
    install -Dm644 schemahero.fish "${pkgdir}/usr/share/fish/vendor_completions.d/schemahero.fish"
}
