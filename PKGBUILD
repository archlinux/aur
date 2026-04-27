# Maintainer: fkzys <fkzys at proton dot me>
pkgname=keys-vault
pkgver=1.0.0
pkgrel=1
pkgdesc="File-based encryption for sensitive directories via gocryptfs + GNOME Keyring"
arch=('any')
url="https://gitlab.com/fkzys/keys-vault"
license=('AGPL-3.0-or-later')
depends=(
    'gocryptfs'
    'libsecret'
    'fuse-common'
)
optdepends=(
    'gnome-keyring: Secret Service provider'
    'bash-completion: bash tab completions'
    'zsh: zsh tab completions'
)
backup=('etc/keys-vault.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9d94c4c88f889afff27d9cac4368ada6ce8e1c581854710d960359e3e9a9b6bc')

check() {
    cd "${pkgname}-v${pkgver}"
    make test
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
