# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.2.1'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/systemd.pueued.service"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-amd64"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-amd64"
    "https://github.com/Nukesor/pueue/blob/master/LICENSE"
)
md5sums=('c4c2767651d310f0db7f078846e1b8a4'
         '068d020c01e49f7296def87daa3058dd'
         '850217b6bba7a1fcca98c7bc31334c7a'
         'e577b173d4f1f9596d91305ba5b38f2d')

build() {
    # Build shell completion files for pueue client
    #pueue-linux-amd64 completions zsh ./
    ./pueue-linux-amd64 completions bash ./
    ./pueue-linux-amd64 completions fish ./
}

package() {
    install -Dm755 "pueue-linux-amd64" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64" "${pkgdir}/usr/bin/pueued"

    # Place systemd user service
    install -Dm644 "systemd.pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    # Zsh is broken for now
    # install -Dm644 "utils/completions/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
