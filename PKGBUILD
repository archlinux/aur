# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.18.24
pkgrel=1
pkgdesc='Mindustry logic extension meta-programming language, for zero additional overhead!'
arch=(x86_64 aarch64)
url=https://github.com/A4-Tacks/mindustry_logic_bang_lang
license=(GPL-3.0)
depends=()
makedepends=(coreutils xz)

s_arch=$(uname -m)
c_name=mindustry_logic_bang_lang

source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/${c_name}-v${pkgver}_"{aarch64,x86_64}"-unknown-linux-musl.tar.xz"
)
sha256sums=(
    551613e41854e0c2d31a7e62898ea19bfe593463e437bbe642768d610ee85059
    ce862c0c5523e7f022583826ad03b06a766e1df69e1abbeea5c3d291d79074f2
    7012184f46946fb6b78a2f955a2152737f00ac3ca75e1ff9dc6261795baa8096
)
case "$s_arch" in
    aarch64|x86_64);;
    *)
        echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    mkdir -pm755 "$pkgdir"/usr/share/$c_name
    cp -r $c_name-$pkgver/{LICENSE,README{,-en_US}.md,syntax,examples} \
        "$pkgdir"/usr/share/$c_name/
    unxz -c "${c_name}-v${pkgver}_${s_arch}-unknown-linux-musl.tar.xz" | tar -x
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
