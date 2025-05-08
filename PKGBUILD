# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=mindustry_logic_bang_lang-bin
pkgver=0.19.12
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
    9ca8abadafe85551381c9bf0dd9c8133a8f68876ef8300c54d14f289457048c1
    c7b02b159877136219febf90c9316126e85985c703863ed99ea079069fd360f3
    5f7e4457af71c1c57b0a2fc6dc112438f703f6ef5672129370311a7a7c890267
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
