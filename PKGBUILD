# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.13.3
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
    6cd1a8480b1791915e8bc005901754a6c73870e66f2a34c5d40b845aa4516527
)
case "$s_arch" in
    aarch64) sha256sums+=(d51071b78b44a67114fdc8bad6ba9b5f3bdac7332513b7eca802cd7c3871debc);;
    x86_64)  sha256sums+=(94b921b186a02c14cd2b04eac074bcff65d75d4deb82b125b31847cb95f582e5);;
    *)
        echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    mkdir -pm644 "$pkgdir"/usr/share/$c_name
    cp -r $c_name-$pkgver/{README{,-en_US}.md,syntax,examples} "$pkgdir"/usr/share/$c_name/
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
