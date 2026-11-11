# Maintainer: czyt <czytcn@gmail.com>
pkgname=rustgrid-bin
pkgver=0.1.11
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
sha256sums_x86_64=('93b08f02637e34fb123fa9e38a96f38d36d7cf553f37b7c1c78f6d291ee59e76')
sha256sums_aarch64=('5435b8cf5ed9dbddc1fba7494edbcdf2deac8ecb4a5a570b0ec7696906b1d7fa')

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
