# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.15.4
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
    abe5e5e28ae742e5118f6e402ebc986d93732b23ea4759fba7000a3074619a5e
    432923b1adff1db2904212b2af6aea959214a74b4003c69ff42a0c91d4dff4f5
    8c52701062a446eac3287fe5dea9905c99ac546e7cdd7012d4e567c04e0fb247
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
