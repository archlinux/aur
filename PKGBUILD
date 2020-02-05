# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.1.6'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "https://github.com/Nukesor/pueue/archive/v${pkgver}.tar.gz"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-amd64"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-amd64"
)
sha256sums=('6b11643497cedfa7517d1c041951be907f6e138e8efc339cd36309943995b8f1'
            '039d11971a190562210fc9ee2a1504256fd1440b9471e1bbbc9bbb86eca3ce49'
            '5933369d330b45e98adf2b7847b6d63314d590c7c78f4bf243a7189cc4b6fd4a')


package() {
    install -Dm755 "pueue-linux-amd64" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64" "${pkgdir}/usr/bin/pueued"

    tar xf "v${pkgver}.tar.gz"
    cd "pueue-${pkgver}"

    # Place systemd user service
    install -Dm644 "utils/pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    # Zsh is broken for now
#    install -Dm644 "utils/completions/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "utils/completions/pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "utils/completions/pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
