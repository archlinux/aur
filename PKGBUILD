# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.17.12
pkgrel=1
pkgdesc='Mindustry logic extension language, for zero additional overhead!'
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
    6c34f6daf6189081c614b8bbd2812257cabd28c9e260ecc2956de284ce5b86e7
    9d6b86ca70236f1006db86abbec1cf16106abb7511b3f9fa10d7f9aca908dd5a
    68c4ca4452caad5af7ff116238f1c2c3dc1e936b832dff809ec43965533be3c6
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
