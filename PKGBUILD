# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.18.1
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
    a8483bef454d15a6451a74c6d24bdcdcee0d864dd9fc060359700181a62d8956
    7203b07cd2c4331756394563074ea4c63ece5e81d7fff0503a11846de4ccb057
    10bc3f25b6b9829f12adfe6aa917531349bef0e9d858c9f6660612b0e20432ee
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
