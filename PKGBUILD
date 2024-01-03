# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.14.5
pkgrel=1
pkgdesc='Mindustry logic extension language, for zero additional overhead!'
arch=(x86_64 aarch64)
url=https://github.com/A4-Tacks/mindustry_logic_bang_lang
license=(GPL-3.0)
depends=()
makedepends=(coreutils)

s_arch=$(uname -m)
c_name=mindustry_logic_bang_lang

source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/${c_name}_v${pkgver}_${s_arch}-unknown-linux-musl.tar.xz"
)
sha256sums=(
    318160ccf41358428a77437674384b0cc757d9ba02dbf38b6dd95487f12fdca2
)
case "$s_arch" in
    aarch64) sha256sums+=(b877dbc9b81667dbebf238dbc5eee0a137fe80ef89313be5f05d92a407df3e4a);;
    x86_64)  sha256sums+=(274ed9a28665885cf77982808e2452f24f21361fd120f381875a96aedc78bff9);;
    *)
        echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    mkdir -pm644 "$pkgdir"/usr/share/$c_name
    cp -r $c_name-$pkgver/{README{,-en_US}.md,syntax,examples} "$pkgdir"/usr/share/$c_name/
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
