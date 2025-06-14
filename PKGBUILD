# Maintainer: A4-Tacks <wdsjxhno 1001 aT 163 dot com>

pkgname=cdecl-to-rsdecl-bin
pkgver=0.2.1
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
    a0d366d847995dca23771f2c44e677f51d6ffb81836a4decff7763086e42c62e
    f7ae9818e2f12003792b69000b3c6536c2d9cf7d3ebc0c204f393d29d21b6a7e
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
