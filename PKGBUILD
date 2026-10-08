# Maintainer: bethropolis
pkgname=sift-context-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Sift a codebase into an LLM-friendly context document'
arch=('x86_64' 'aarch64')
url='https://github.com/bethropolis/sift'
license=('MIT')
provides=('sift')
conflicts=('sift')
options=('!debug')
optdepends=('chromium: chromeless window for sift serve --app'
            'git: repository cloning with sift clone and serve --allow-clone')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/bethropolis/sift/releases/download/v$pkgver/sift_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/bethropolis/sift/releases/download/v$pkgver/sift_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9b82e6fe05ec2842f032b27ed596610f4babda2716724f5d217621ff9c8b2557')
sha256sums_aarch64=('440dbe3583ae01fdabef4ad64afa42ce01099e92a17839832dd1a92d29ff35cb')

package() {
  install -Dm755 sift "$pkgdir/usr/bin/sift"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/share/bash-completion/completions" \
                 "$pkgdir/usr/share/zsh/site-functions" \
                 "$pkgdir/usr/share/fish/vendor_completions.d"
  ./sift completion bash > "$pkgdir/usr/share/bash-completion/completions/sift"
  ./sift completion zsh > "$pkgdir/usr/share/zsh/site-functions/_sift"
  ./sift completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/sift.fish"
}
