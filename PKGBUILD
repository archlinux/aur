# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=mani-bin
pkgver=0.32.1
pkgrel=1
pkgdesc='A CLI tool that helps you manage multiple repositories'
arch=('x86_64' 'aarch64')
url='https://manicli.com'
license=('MIT')
provides=('mani')
conflicts=('mani')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alajmo/mani/releases/download/v${pkgver}/mani_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alajmo/mani/releases/download/v${pkgver}/mani_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b4aee0b35938bc76a387c4baa7b68cc11287ceca6a8e8b3de8fdc7fae182fb81')
sha256sums_aarch64=('19d28407d2c81be9c2ba844dad4ef5ad59764a44be5356af8fa0e99ed5dab817')

package() {
  install -Dm755 mani "$pkgdir/usr/bin/mani"
  install -Dm644 mani.1 "$pkgdir/usr/share/man/man1/mani.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  ./mani completion bash > "$pkgdir/usr/share/bash-completion/completions/mani"

  install -d "$pkgdir/usr/share/zsh/site-functions"
  ./mani completion zsh > "$pkgdir/usr/share/zsh/site-functions/_mani"

  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./mani completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/mani.fish"
}
