# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=schemahero-bin
pkgver=0.25.1
pkgrel=1
pkgdesc='Declarative database schema management as code (CNCF)'
arch=('x86_64' 'aarch64')
url='https://github.com/schemahero/schemahero'
license=('Apache-2.0')
provides=('schemahero')
conflicts=('schemahero')
source_x86_64=("schemahero-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_amd64.tar.gz")
source_aarch64=("schemahero-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_arm64.tar.gz")
sha256sums_x86_64=('78574bcf4e9ef1e74ef85c803295eda4b93cc55c31b38d9c95f251a6dd36654e')
sha256sums_aarch64=('e00948669273744f36be50dc286b227c43ccf0d9d3f21fd53805b26dfd26c52b')

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
