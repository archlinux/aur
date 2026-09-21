# Maintainer: MasketLP
#
# pkgver is rewritten from the release tag, and checksums by updpkgsums, by
# packaging/aur/publish.sh on every release.
pkgname=mlp-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Encrypt and decrypt files with AES-256-GCM using an auto-managed keyfile (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/EldinBegano/mask-decryption'
license=('GPL-3.0-or-later')
provides=('mlp')
conflicts=('mlp')
source_x86_64=("$url/releases/download/v$pkgver/mask-decryption_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/mask-decryption_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('550cc769003a36373206b2f51d1ae868d36330e0926b542bca7d0085a2e603a5')
sha256sums_aarch64=('5f571aaff9e921cc156ed1ab1e4e2ba02284d6cd042269006123e5b691fe02ce')

check() {
  export MLP_CONFIG_DIR="$srcdir/check-config"
  test "$(./mlp --version)" = "mlp $pkgver"
}

package() {
  install -Dm755 mlp "$pkgdir/usr/bin/mlp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/mlp.bash "$pkgdir/usr/share/bash-completion/completions/mlp"
  install -Dm644 completions/_mlp "$pkgdir/usr/share/zsh/site-functions/_mlp"
  install -Dm644 completions/mlp.fish "$pkgdir/usr/share/fish/vendor_completions.d/mlp.fish"
}
