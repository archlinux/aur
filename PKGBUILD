# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Repackages the static musl release tarball: no runtime dependencies. whytime needs
# Linux >= 5.18 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap); see the README.

pkgname=whytime-bin
_pkgname=whytime
pkgver=0.1.1
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
sha256sums_x86_64=('95ef313bb5f710907e061876c0ab6314ebd579b7db97c770b440632c84f2c984')
sha256sums_aarch64=('b326545b2a29b902dcdab51f8a26841fc44bab9e1c0b52e202651f479d333b1d')

package() {
  cd "$_pkgname-v$pkgver-$CARCH-linux-musl"
  install -Dm755 whytime -t "$pkgdir/usr/bin"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 completions/whytime.bash "$pkgdir/usr/share/bash-completion/completions/whytime"
  install -Dm644 completions/_whytime -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/whytime.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 LICENSE THIRD_PARTY_LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
