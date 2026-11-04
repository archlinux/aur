# Maintainer: prietus <prietus@live.com>
pkgname=aurgus-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="AUR helper that audits PKGBUILDs before building them (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/aurgus"
license=('GPL-3.0-or-later')
depends=('pacman' 'git' 'coreutils')
optdepends=('sudo: privilege elevation'
            'doas: privilege elevation'
            'gnupg: import PGP keys needed to verify sources')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
_name="${pkgname%-bin}-$pkgver"
source_x86_64=("$url/releases/download/v$pkgver/$_name-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_name-aarch64-linux.tar.gz")
sha256sums_x86_64=('6b113bd13b7845773126e6db9f036dc8e9964f1cd18449fde9e43db6bff31135')
sha256sums_aarch64=('eeed8272ed5b43fe71266954f3be2bd0504a3a8103d5665b0cb664a25682cebc')

package() {
  cd "$_name-$CARCH-linux"
  install -Dm755 aurgus "$pkgdir/usr/bin/aurgus"
  install -Dm644 completions/aurgus.bash "$pkgdir/usr/share/bash-completion/completions/aurgus"
  install -Dm644 completions/_aurgus "$pkgdir/usr/share/zsh/site-functions/_aurgus"
  install -Dm644 completions/aurgus.fish "$pkgdir/usr/share/fish/vendor_completions.d/aurgus.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/aurgus/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/aurgus/LICENSE"
}
