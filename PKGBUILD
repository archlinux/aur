# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=schemahero-bin
pkgver=0.26.3
pkgrel=1
pkgdesc='Declarative database schema management as code (CNCF)'
arch=('x86_64' 'aarch64')
url='https://github.com/schemahero/schemahero'
license=('Apache-2.0')
provides=('schemahero')
conflicts=('schemahero')
source_x86_64=("schemahero-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_amd64.tar.gz")
source_aarch64=("schemahero-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/schemahero_linux_arm64.tar.gz")
sha256sums_x86_64=('37bd0a1a3429d589897eac79a520384f6a1142015292a9033db88622748b1c45')
sha256sums_aarch64=('d21e744bc624214b5365c0b18931c055f473fa6cdeb0195750643b8b5567927e')

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
