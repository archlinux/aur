# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.15.3
pkgrel=1
pkgdesc='Mindustry logic extension language, for zero additional overhead!'
arch=(x86_64 aarch64)
url=https://githubfast.com/A4-Tacks/mindustry_logic_bang_lang
license=(GPL-3.0)
depends=()
makedepends=(coreutils xz)

s_arch=$(uname -m)
c_name=mindustry_logic_bang_lang

source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/${c_name}_v${pkgver}_"{aarch64,x86_64}"-unknown-linux-musl.tar.xz"
)
sha256sums=(
    545a6a95b2d15577d34d33489489300e1102e327ddb97dffc5543907929c7a1a
    3c2a91859dd4e31ddacbb36be96e43fe155044436ed959bbdc8833f9128ffd13
    00e8de7c90d198b9c27442ddf63dd3b91ba1bfb744897ae84296b82c1dbcdf24
)
case "$s_arch" in
    aarch64|x86_64);;
    *)
        echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    mkdir -pm644 "$pkgdir"/usr/share/$c_name
    cp -r $c_name-$pkgver/{README{,-en_US}.md,syntax,examples} "$pkgdir"/usr/share/$c_name/
    unxz -c "${c_name}_v${pkgver}_${s_arch}-unknown-linux-musl.tar.xz" | tar -x
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
