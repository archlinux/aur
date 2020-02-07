# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.1.6'
pkgrel=2
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "https://github.com/Nukesor/pueue/archive/v0.1.6.tar.gz"
    "https://github.com/Nukesor/pueue/releases/download/v0.1.6/pueue-linux-amd64"
    "https://github.com/Nukesor/pueue/releases/download/v0.1.6/pueued-linux-amd64"
)
sha256sums=('6b11643497cedfa7517d1c041951be907f6e138e8efc339cd36309943995b8f1'
            'b6fed858e820b2205cdee8ffe131ef3443e919bd4de61785708418d761a462b5'
            'd3f176304797ea088e78901f5ab3473bef6a6873464b50089da69b10c7444daf')


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
