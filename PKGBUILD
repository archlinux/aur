# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=pueue-git
pkgver='r148.b4f9611'
pkgrel=1
arch=('any')
pkgdesc='A task manager and scheduler for shell commands'
license=('MIT')
depends=('cargo')
conflicts=('pueue')
makedepends=('git')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=("git+https://github.com/nukesor/pueue.git")
sha256sums=('SKIP')


build() {
    cd pueue

    # Build the daemon and client
    cargo build --release
}

package() {
    cd pueue

    # Install binaries
    install -Dm755 "target/release/pueue" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "target/release/pueued" "${pkgdir}/usr/bin/pueued"

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
