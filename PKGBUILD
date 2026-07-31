# Maintainer: Fahry-a <farhannzarm@gmail.com>

pkgname=odm-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Oryn Download Manager — aria2c-inspired CLI download manager with Connection Balancer, parallel download acceleration, pacman/ILoveCandy progress bar, JSON-RPC + WebSocket daemon, and resume support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

source_i686=(
    "${pkgname}-${pkgver}-linux_386::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_386"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_armv7h=(
    "${pkgname}-${pkgver}-linux_arm::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)

sha256sums_i686=('7789358b1b975675d912cb98da54804591e3145703cfe58fd44007fa9121fdce'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_x86_64=('8db38c82e9e5753b5ed87dc5a1e401b2b65bdf4530d1719dfe8b05e882f0866e'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_armv7h=('10119108f2dc7e2233e922aad3009100545e3994733b479f21a32336d98d3f2f'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('a4d8d868d3c09d7275973c3268a10ab07d4a4d6d4986faaff2da73ccfd57ca89'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')

# Sanity-check the downloaded binary before packaging: it must exist, run on
# the build machine, and report the pkgver we are about to ship.
check() {
    local _bin
    case "$CARCH" in
        i686)  _bin="${pkgname}-${pkgver}-linux_386" ;;
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        armv7h) _bin="${pkgname}-${pkgver}-linux_arm" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    "$srcdir/$_bin" --version | grep -qF "$pkgver"
}

package() {
    local _bin
    case "$CARCH" in
        i686)  _bin="${pkgname}-${pkgver}-linux_386" ;;
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        armv7h) _bin="${pkgname}-${pkgver}-linux_arm" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/odm"

    install -Dm644 "$srcdir/${pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/odm.1"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.conf.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
