# Maintainer: Fahry-a <farhannzarm@gmail.com>
# PKGBUILD for ODM (Oryn Download Manager) — Arch / CachyOS.
# Pre-built binary package (downloads from GitHub Releases).
#
# AUR publishing: tag a release (git tag v$pkgver), then update sha256sums:
#   updpkgsums   # or: makepkg -g >> PKGBUILD
#   makepkg --printsrcinfo > .SRCINFO

pkgname=odm-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Oryn Download Manager — an aria2c-inspired CLI with a Connection Balancer and a pacman-style progress bar"
arch=('x86_64' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
depends=('glibc')
backup=('etc/odm/config.conf.example')
options=('!strip')

source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64"
    "${pkgname}.1::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/docs/odm.1"
    "${pkgname}.conf.example::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/configs/odm.conf.example"
    "${pkgname}.service::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/packaging/odm.service"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64"
    "${pkgname}.1::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/docs/odm.1"
    "${pkgname}.conf.example::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/configs/odm.conf.example"
    "${pkgname}.service::https://raw.githubusercontent.com/Fahry-a/odm/v${pkgver}/packaging/odm.service"
)

sha256sums_x86_64=('4c34c8fe20e0583f200e5d66097bfac1005e1021f643b98833aa658a83484619'
                    'e4ce4b2444a15646e33917442c92c99473230675f1fbe23959c07d1da15fd6bc'
                    '147927f1159686577a143c88cebff2d8ca25daf781e344c989a8db4e856ea748'
                    '314998f62c236fb2aaa7362e2b1638a72627eb2702f95f9fac4e7219c10a5b7e')
sha256sums_aarch64=('4c58158a0ab80fe592ab06b02204423554cbadfb043ba104463b1e441ec64bbc'
                    'e4ce4b2444a15646e33917442c92c99473230675f1fbe23959c07d1da15fd6bc'
                    '147927f1159686577a143c88cebff2d8ca25daf781e344c989a8db4e856ea748'
                    '314998f62c236fb2aaa7362e2b1638a72627eb2702f95f9fac4e7219c10a5b7e')

package() {
    local _bin
    case "$CARCH" in
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/odm"

    install -Dm644 "$srcdir/${pkgname}.1" "$pkgdir/usr/share/man/man1/odm.1"
    install -Dm644 "$srcdir/${pkgname}.conf.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}.conf.example" "$pkgdir/etc/odm/config.conf"
    install -Dm644 "$srcdir/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
}
