# Maintainer: Evgenii Tsvigun <gene@chainhackers.xyz>
pkgname=correct-unicorn
pkgver=0.2.0
pkgrel=1
pkgdesc="Passphrase generator inspired by xkcd 936"
arch=('x86_64' 'aarch64')
url="https://github.com/utgarda/correct-unicorn"
license=('MIT')
depends=('words' 'gmp')
makedepends=('stack')
_tagver=0.2.0
source=("git+https://github.com/utgarda/${pkgname}.git?signed#tag=v${_tagver}")
sha256sums=('SKIP')
validpgpkeys=('37532468A03463C48B7631403B00CAB0BD4D8648')  # Evgenii Tsvigun <gene@chainhackers.xyz>

build() {
    cd "${pkgname}"
    stack build
}

package() {
    cd "${pkgname}"

    # Install binary
    local _binpath=$(stack path --local-install-root)/bin/correct-unicorn
    install -Dm755 "${_binpath}" "${pkgdir}/usr/bin/correct-unicorn"

    # Install system configuration
    install -Dm644 etc/correct-unicorn/config.toml "${pkgdir}/etc/correct-unicorn/config.toml"

    # Install documentation
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 ChangeLog.md "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog.md"
    install -Dm644 docs/configuration.md "${pkgdir}/usr/share/doc/${pkgname}/configuration.md"
    install -Dm644 docs/dictionaries.md "${pkgdir}/usr/share/doc/${pkgname}/dictionaries.md"
    install -Dm644 docs/installation.md "${pkgdir}/usr/share/doc/${pkgname}/installation.md"
    install -Dm644 docs/pass-integration.md "${pkgdir}/usr/share/doc/${pkgname}/pass-integration.md"
    install -Dm644 docs/example-config.toml "${pkgdir}/usr/share/doc/${pkgname}/example-config.toml"
}
