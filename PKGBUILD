# Maintainer: czyt <czytcn@gmail.com>
pkgname=rustgrid-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Native database GUI for SQL and Redis, built in Rust without WebView"
arch=('x86_64' 'aarch64')
url="https://github.com/yisier/rustgrid"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb')
optdepends=(
    'noto-fonts: CJK fonts used by the database table view'
    'ttf-dejavu: monospace font for the editor'
)
provides=('rustgrid')
conflicts=('rustgrid')
options=('!strip' '!debug')
source_x86_64=("RustGrid-${pkgver}-linux-x64.tar.gz::https://github.com/yisier/rustgrid/releases/download/v${pkgver}/RustGrid-${pkgver}-linux-x64.tar.gz")
source_aarch64=("RustGrid-${pkgver}-linux-arm64.tar.gz::https://github.com/yisier/rustgrid/releases/download/v${pkgver}/RustGrid-${pkgver}-linux-arm64.tar.gz")
source=("rustgrid-icon.png::https://raw.githubusercontent.com/yisier/rustgrid/v0.1.6/crates/rustgrid-app/assets/logo.png")
sha256sums=('e8c73449133ba38031be6d0b6c56b18f7333293794f9853000fba295eda67d34')
sha256sums_x86_64=('517b88a1e812aaa2ad4489c4f40a671cc6cdca6425b9443672f08694518ee271')
sha256sums_aarch64=('37c18ff093c68f07393a376d95f61506cc85e9fd385b9ec9adfce826c76ff6d5')

package() {
    local _arch="x86_64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="arm64"

    install -Dm755 "${srcdir}/RustGrid" "${pkgdir}/usr/bin/rustgrid"

    install -Dm644 "${srcdir}/rustgrid-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rustgrid.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rustgrid.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=RustGrid
GenericName=Database Manager
Comment=Native database GUI for SQL and Redis
Exec=rustgrid %U
Icon=rustgrid
Terminal=false
Categories=Development;Database;
StartupNotify=true
Keywords=sql;redis;database;postgres;mysql;sqlite;
EOF
}
