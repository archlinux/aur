pkgname=pd-bin
pkgver=b86cc88
pkgrel=1
pkgdesc="Perfect Dark Reimplimentation engine bin package compiled from the official repository: https://github.com/fgsfdsfgs/perfect_dark"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/linuxbombay/perfectdark"
source_x86_64=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-x86_64-linux.zip")
source_i686=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-i686-linux.zip")
source_aarch64=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-arm64-linux.zip")
license=('GPL')
depends=('sdl2' 'alsa-lib' 'alsa-plugins' 'pipewire')

sha256sums_x86_64=('cef905aef80dfcb9f3637aaf3d5b44156fedf6b4f0528740c712348f60051e77')
sha256sums_i686=('a9c10a70d5e109544d1b37cb2c4e812640605b3339e735800e2d197ede91af32')
sha256sums_aarch64=('738cd6278c3736d6e0c9335f9ff7ebd8eaf8aa6f52d22998764e090035a42239')

package() {
    install -dm755 "$pkgdir/usr/bin"

    local bin_arch
    local bin

    case "$CARCH" in
        x86_64) bin_arch='x86_64' ;;
        i686) bin_arch='i686' ;;
        aarch64) bin_arch='arm64' ;;
        *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
    esac

    for bin in "pd.$bin_arch" "pd.pal.$bin_arch" "pd.jpn.$bin_arch"; do
        install -Dm755 "$srcdir/$bin" "$pkgdir/usr/bin/${bin%.$bin_arch}"
    done
}
