# Maintainer: Ahmet Ötegen <ahm3t0t@users.noreply.github.com>
# https://github.com/ahm3t0t/bigfive-updater

pkgname=bigfive-updater
pkgver=6.0.2
pkgrel=1
pkgdesc="Armored, Smart, Multi-Distro Update Tool for Linux Systems"
arch=('any')
url="https://github.com/ahm3t0t/bigfive-updater"
license=('MIT')
depends=('bash' 'curl')
optdepends=(
    'flatpak: Flatpak application updates'
    'snapd: Snap package updates'
    'fwupd: Firmware updates'
    'snapper: Btrfs/LVM snapshot support'
    'timeshift: System restore point support'
)
provides=('guncel' 'updater')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a40ce496c241fd60368da51a962372399666e083656f5b8115d26fd8f87957c1')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Main script
    install -Dm755 guncel "${pkgdir}/usr/bin/guncel"

    # Symlinks for alternative command names
    ln -s guncel "${pkgdir}/usr/bin/updater"
    ln -s guncel "${pkgdir}/usr/bin/bigfive"

    # Language files
    install -Dm644 lang/tr.sh "${pkgdir}/usr/share/${pkgname}/lang/tr.sh"
    install -Dm644 lang/en.sh "${pkgdir}/usr/share/${pkgname}/lang/en.sh"

    # Man pages
    install -Dm644 docs/guncel.8 "${pkgdir}/usr/share/man/man8/guncel.8"
    ln -s guncel.8 "${pkgdir}/usr/share/man/man8/updater.8"
    ln -s guncel.8 "${pkgdir}/usr/share/man/man8/bigfive.8"

    # Turkish man page
    install -Dm644 docs/guncel.8.tr "${pkgdir}/usr/share/man/tr/man8/guncel.8"

    # Bash completion
    install -Dm644 completions/guncel.bash \
        "${pkgdir}/usr/share/bash-completion/completions/guncel"
    ln -s guncel "${pkgdir}/usr/share/bash-completion/completions/updater"
    ln -s guncel "${pkgdir}/usr/share/bash-completion/completions/bigfive"

    # Zsh completion
    install -Dm644 completions/_guncel \
        "${pkgdir}/usr/share/zsh/site-functions/_guncel"
    ln -s _guncel "${pkgdir}/usr/share/zsh/site-functions/_updater"
    ln -s _guncel "${pkgdir}/usr/share/zsh/site-functions/_bigfive"

    # Fish completion
    install -Dm644 completions/guncel.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/guncel.fish"
    ln -s guncel.fish "${pkgdir}/usr/share/fish/vendor_completions.d/updater.fish"
    ln -s guncel.fish "${pkgdir}/usr/share/fish/vendor_completions.d/bigfive.fish"

    # Config example
    install -Dm644 bigfive-updater.conf.example \
        "${pkgdir}/etc/${pkgname}.conf.example"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.en.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
