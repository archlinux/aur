# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.21.11
pkgrel=9
pkgdesc='Mindustry logic extension meta-programming language, for zero additional overhead!'
arch=(x86_64 aarch64)
url=https://github.com/A4-Tacks/mindustry_logic_bang_lang
license=(GPL-3.0)
depends=()
makedepends=(coreutils xz)

s_arch=$(uname -m)
c_name=mindustry_logic_bang_lang

rawver=$pkgver-$pkgrel
rawver=${rawver%-1}

source=(
    "$url/archive/refs/tags/v$rawver.tar.gz"
    "$url/releases/download/v$rawver/${c_name}-v${rawver}_"{aarch64,x86_64}"-unknown-linux-musl.tar.xz"
)
sha256sums=(
    5d61124dd2545aec0b141618b13afb38647f2e264615e13df2afd8dec4ec701b
    d0bb4edd84b6221bc6d619ad824a057c9803058e4b95c6e5c59d5c8441e8513f
    2e61e15bfc087d4f28a8746b0dfbad5deca5af4433a78f81d6af959dd14b05db
)
case "$s_arch" in
    aarch64|x86_64);;
    *)
        echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    mkdir -pm755 "$pkgdir"/usr/share/$c_name
    cp -r $c_name-$rawver/{LICENSE,README{,-en_US}.md,syntax,examples} \
        "$pkgdir"/usr/share/$c_name/
    unxz -c "${c_name}-v${rawver}_${s_arch}-unknown-linux-musl.tar.xz" | tar -x
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
