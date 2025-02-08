# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.18.4
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
    "$url/releases/download/v$pkgver/${c_name}_v${pkgver}_"{aarch64,x86_64}"-unknown-linux-musl.tar.xz"
)
sha256sums=(
    7faf04241032915f914e89f4a9baf350cc7155bf6a39b78e2db132def389c180
    563a79adf56c726072805a1eb5795c29c7b1163fffec667113d4c7a19e6ea966
    88612c4179a16729c42de8aeffdf2eabe2ee2a6a537cc7d3f28c4d6410569f4f
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
    unxz -c "${c_name}_v${pkgver}_${s_arch}-unknown-linux-musl.tar.xz" | tar -x
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
