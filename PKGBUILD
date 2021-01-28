# Maintainer: alienzj <alienchuj@gmail.com>
# Contributor: Steven Tang <xosdy.t@gmail.com>
# Contributor: ohmyarch <ohmyarchlinux@protonmail.com>
# Contributor: Dct Mei <dctxmei@gmail.com>

pkgbase=geph4-git
_pkgbase=geph4
pkgname=('geph4-binder-git'
         'geph4-bridge-git'
         'geph4-client-git'
         'geph4-exit-git'
         'geph4-vpn-helper-git')
pkgver=r247.1f5e7bf
pkgrel=4
pkgdesc='A command-line Geph4 toolset'
arch=('x86_64')
url="https://github.com/geph-official/geph4"
license=('GPL3')
groups=('geph4-git')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("geph4")
conflicts=("geph4")
source=("git+${url}.git"
        "geph4-client.default"
        "geph4-exit.default"
        "geph4-client.sysusers"
        "geph4-exit.sysusers"
        "geph4-client.service"
        "geph4-exit.service")
sha256sums=('SKIP'
            'c4e640282f1bbf5df7ecb8d21367b7400bf1e5801d82d60a33e22d2d167d8471'
            '56813c054910d5e2c64000f7f58d063313a44c04844f3b3424ed9622751b5b93'
            '3384497abbd8504996fe52128cc1f34dbbf056da9a67e56b82a9df8b940686b0'
            'd3a3dc8d148798d464dc0296a129407c121276e3aa56fa59ae2b41d236753b76'
            'c3495a0539b3519299b7fa83dece78ede20b5735d4504d22523166d80a9fcf0a'
            '4a7da8c14301ecd8c882d7457e0e7c4134cfefd9472abb321d98c6825e2a997c')

pkgver() {
    cd "${srcdir}"/"${_pkgbase}"/
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"/"${_pkgbase}"/
    cargo build --release --manifest-path=geph4-binder/Cargo.toml
    cargo build --release --manifest-path=geph4-bridge/Cargo.toml
    cargo build --release --manifest-path=geph4-client/Cargo.toml
    cargo build --release --manifest-path=geph4-exit/Cargo.toml
    cargo build --release --manifest-path=geph4-vpn-helper/Cargo.toml
}

package_geph4-binder-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-binder-git/LICENSE
    install -Dm 755 target/release/geph4-binder -t "${pkgdir}"/usr/bin/
}

package_geph4-bridge-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-bridge-git/LICENSE
    install -Dm 755 target/release/geph4-bridge -t "${pkgdir}"/usr/bin/
}

package_geph4-client-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-client-git/LICENSE
    install -Dm 755 target/release/geph4-client -t "${pkgdir}"/usr/bin/
    install -Dm 644 "${srcdir}"/geph4-client.default "${pkgdir}"/etc/default/geph4-client
    install -Dm 644 "${srcdir}"/geph4-client.sysusers "${pkgdir}"/usr/lib/sysusers.d/geph4-client.conf
    install -Dm 644 "${srcdir}"/geph4-client.service -t "${pkgdir}"/usr/lib/systemd/system/
}

package_geph4-exit-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-exit-git/LICENSE
    install -Dm 755 target/release/geph4-exit -t "${pkgdir}"/usr/bin/
    install -Dm 644 "${srcdir}"/geph4-exit.default "${pkgdir}"/etc/default/geph4-exit
    install -Dm 644 "${srcdir}"/geph4-exit.sysusers "${pkgdir}"/usr/lib/sysusers.d/geph4-exit.conf
    install -Dm 644 "${srcdir}"/geph4-exit.service -t "${pkgdir}"/usr/lib/systemd/system/
}

package_geph4-vpn-helper-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-vpn-helper-git/LICENSE
    install -Dm 755 target/release/geph4-vpn-helper -t "$pkgdir/usr/bin/"
}
