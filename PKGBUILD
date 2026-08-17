# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=schemahero-bin
pkgver=0.26.0
pkgrel=1
pkgdesc='Declarative database schema management as code (CNCF)'
arch=('x86_64' 'aarch64')
url='https://github.com/schemahero/schemahero'
license=('Apache-2.0')
provides=('schemahero')
conflicts=('schemahero')
source_x86_64=("schemahero-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_amd64.tar.gz")
source_aarch64=("schemahero-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_arm64.tar.gz")
sha256sums_x86_64=('1d0cc5d4f233b5cc251f66d5bacdc228e501ea2385e967dcefd1056b6135a7b4')
sha256sums_aarch64=('9fe56fce23d42e5132acedd3af54de8b1a98eae718b8b9773a830e94eaa65d54')

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
