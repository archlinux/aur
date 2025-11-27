# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.8.7
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors (prebuilt binaries)'
arch=('x86_64')
url='https://wayscriber.com'
license=('MIT')
install=wayscriber-bin.install
depends=(
    'cairo'
    'wayland'
    'pango'
    'libxkbcommon'
    'gcc-libs'
    'glibc'
    'wl-clipboard'
    'grim'
    'slurp'
) 
optdepends=(
    'wayscriber-configurator: GUI configurator (F11)'
)
backup=('usr/lib/systemd/user/wayscriber.service')
provides=('wayscriber')
conflicts=('wayscriber' 'wayscriber-debug')
replaces=('wayscriber-debug')
source_x86_64=("wayscriber-v0.8.7-linux-x86_64.tar.gz::https://github.com/devmobasa/wayscriber/releases/download/v0.8.7/wayscriber-v0.8.7-linux-x86_64.tar.gz")
sha256sums_x86_64=('7c8e927e59d8a68d24e92b506d3fee36d3f71a511717de1ca3c2e05199038c4d')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    local srcdir_tmp="${srcdir}/extract"
    rm -rf "${srcdir_tmp}"
    mkdir -p "${srcdir_tmp}"
    tar -xzf "${srcdir}/${_tarball}" -C "${srcdir_tmp}" --strip-components=1

    install -Dm755 "${srcdir_tmp}/usr/bin/wayscriber" "$pkgdir/usr/bin/wayscriber"
    install -Dm644 "${srcdir_tmp}/usr/lib/systemd/user/wayscriber.service" "$pkgdir/usr/lib/systemd/user/wayscriber.service"
    install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/config.example.toml" "$pkgdir/usr/share/doc/wayscriber/config.example.toml"
    install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/README.md" "$pkgdir/usr/share/doc/wayscriber/README.md"
    [ -f "${srcdir_tmp}/usr/share/doc/wayscriber/LICENSE" ] && install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
