# Maintainer: MasketLP
#
# pkgver is rewritten from the release tag, and checksums by updpkgsums, by
# packaging/aur/publish.sh on every release.
pkgname=mlp-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Encrypt and decrypt files with AES-256-GCM using an auto-managed keyfile (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/EldinBegano/mask-decryption'
license=('GPL-3.0-or-later')
provides=('mlp')
conflicts=('mlp')
options=('!debug')
source_x86_64=("$url/releases/download/v$pkgver/mask-decryption_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/mask-decryption_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d5def29ce4dd54bc46a178445cbdeeedc1e98d8ebb8efc773d8fe9871627afa2')
sha256sums_aarch64=('bc723960eb908b304917ef35eb2a478b7d22fb028805cd501fdbe7d15cc9d095')

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
