# Maintainer: Celestia Ludenberg <ash8820@proton.me>
pkgname=solara-installer
pkgver=0.1.0
pkgrel=1
pkgdesc="Solara Linux GUI installer (Qt 6 + Rust)"
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'arch-install-scripts'
    'parted'
    'util-linux'
    'btrfs-progs'
    'e2fsprogs'
    'xfsprogs'
    'f2fs-tools'
    'dosfstools'
    'polkit'
    'networkmanager'
    'grub'
)
makedepends=(
    'rust'
    'cargo'
    'clang'
    'cmake'
    'pkgconf'
    'ninja'
    'qt6-base'
    'qt6-declarative'
    'qt6-tools'
)
options=('!strip' '!debug' '!lto')

_commit=dfb0f0dfc7580c13256b6d6a5ea7c9fbf3b40e38
source=("https://github.com/celestia-foundation/solara/archive/${_commit}.tar.gz")
b2sums=('SKIP')

build() {
    cd "solara-${_commit}/installer"
    LDFLAGS="" cargo build --release -p installer-gui
}

package() {
    cd "solara-${_commit}"
    install -Dm755 installer/target/release/solara-installer \
        "$pkgdir/usr/bin/solara-installer"

    install -Dm644 releng/packages/installer/org.solara.installer.policy \
        "$pkgdir/usr/share/polkit-1/actions/org.solara.installer.policy"

    install -Dm644 releng/packages/installer/solara-installer.desktop \
        "$pkgdir/usr/share/applications/solara-installer.desktop"
}
