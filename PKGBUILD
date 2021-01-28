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
pkgrel=5
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
            '980c0a9755ffee76068d8a250d533d2118037c7a3fec70e167990934ba9c0619'
            '2daf5117a98d4529225712cb9f4828f4f5269a591565745497df0eb10068ba2a'
            '3384497abbd8504996fe52128cc1f34dbbf056da9a67e56b82a9df8b940686b0'
            'd3a3dc8d148798d464dc0296a129407c121276e3aa56fa59ae2b41d236753b76'
            '16bc33c928466bb3881a445a47b91b38172828dc526ab15568d4b62693fc0046'
            '29a65808d343d449476154a2023f8a9bd15838fd5bbab1ab9a3b615aa652d066')

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
