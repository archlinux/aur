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
pkgrel=2
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
        "geph4-client.service"
        "geph4-client@.service"
        "geph4-client-user.service"
        "geph4-exit.service"
        "geph4-exit-user.service"
        "geph4-client.sysusers"
        "geph4-exit.sysusers")
sha256sums=('SKIP'
            '2094012da2f85c59c83fbd61c13af8a6be6913c026579753888b30f183bba603'
            '2094012da2f85c59c83fbd61c13af8a6be6913c026579753888b30f183bba603'
            'a5481e7c3f0bccafe23ca14d8be4342177e3acfea0c0aafd245ba6252f00e2a6'
            '44b2aac2fc7ee30ec061736e8ac328d8caa4d0e8865fd984ada51ef3b2a216a8'
            '5faa4612a96592d84f98fb4a3a7d162041f033b0120982830fdb1372675246c0'
            '3384497abbd8504996fe52128cc1f34dbbf056da9a67e56b82a9df8b940686b0'
            'd3a3dc8d148798d464dc0296a129407c121276e3aa56fa59ae2b41d236753b76')

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
    install -Dm 644 "${srcdir}"/geph4-client.sysusers "${pkgdir}"/usr/lib/sysusers.d/geph4-client.conf
    install -Dm 644 "${srcdir}"/geph4-client.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 "${srcdir}"/geph4-client@.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 "${srcdir}"/geph4-client-user.service "${pkgdir}"/usr/lib/systemd/user/geph4-client.service
}

package_geph4-exit-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-exit-git/LICENSE
    install -Dm 755 target/release/geph4-exit -t "${pkgdir}"/usr/bin/
    install -Dm 644 "${srcdir}"/geph4-exit.sysusers "${pkgdir}"/usr/lib/sysusers.d/geph4-exit.conf
    install -Dm 644 "${srcdir}"/geph4-exit.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 "${srcdir}"/geph4-exit-user.service "${pkgdir}"/usr/lib/systemd/user/geph4-exit.service
}

package_geph4-vpn-helper-git() {
    cd "${srcdir}"/"${_pkgbase}"/
    install -Dm 644 LICENSE.md "${pkgdir}"/usr/share/licenses/geph4-vpn-helper-git/LICENSE
    install -Dm 755 target/release/geph4-vpn-helper -t "$pkgdir/usr/bin/"
}
