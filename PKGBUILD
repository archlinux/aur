# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=cdecl-to-rsdecl-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Convert some C declaration into Rust style declaration'
arch=(x86_64 aarch64)
url=https://github.com/A4-Tacks/cdecl-to-rsdecl
license=(MIT)
depends=()
makedepends=(coreutils)

s_arch=$(uname -m)
c_name=${pkgname%-bin}

source=(
    "$url/releases/download/v$pkgver/$c_name-v$pkgver-"{aarch64,x86_64}"-unknown-linux-musl.tar.gz"
)
sha256sums=(
    5e519e10742a50f37a95af251b9163668fcf74f784aefed564362b22854afeb3
    226f4607bc73d465845970fba1b3f976f469ab2f7db3a8bc13dccbeff3591dba
)
case "$s_arch" in
    aarch64|x86_64);;
    *)  echo "E: Arch $s_arch unsupported!" >&2
        exit 1
esac

package() {
    tar -xzf "$c_name-v$pkgver-$s_arch-unknown-linux-musl.tar.gz"
    install -Dm755 -t "$pkgdir"/usr/bin/ $c_name
}
