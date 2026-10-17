# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Repackages the static musl release tarball: no runtime dependencies. whytime needs
# Linux >= 5.18 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap); see the README.

pkgname=whytime-bin
_pkgname=whytime
pkgver=0.1.2
pkgrel=1
pkgdesc="Explains where a command's wall-clock time went: off-CPU and on-CPU attribution from eBPF"
arch=(x86_64 aarch64)
url=https://github.com/Arinerron/whytime
license=(MIT)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('9fe0bcea11910e6fc8a1f83432fe14fd5ca814d4a894e0ea2c2c163aa14c8178')
sha256sums_aarch64=('76a0ae749dc91cbb8b32dc7c04932f15911f460acc1ec1823f9d7f8268ae7484')

package() {
  cd "$_pkgname-v$pkgver-$CARCH-linux-musl"
  install -Dm755 whytime -t "$pkgdir/usr/bin"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 completions/whytime.bash "$pkgdir/usr/share/bash-completion/completions/whytime"
  install -Dm644 completions/_whytime -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/whytime.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 LICENSE THIRD_PARTY_LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
