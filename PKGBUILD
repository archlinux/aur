# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=phpup-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Cross-Platform PHP version manager written in rust"
arch=("x86_64")
url="https://github.com/masan4444/phpup"
license=("MIT")
provides=("phpup")
conflicts=("phpup" "phpup-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/phpup-linux.zip")
sha256sums=('5eb98b0da31dd4c33c44a60f25aec72f6ab1a351a255950fe3880ea0745bcfa3')

package() {
  mkdir -p "$pkgdir/opt/phpup"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/phpup-linux/." "$pkgdir/opt/phpup"
  ln -s "/opt/phpup/phpup" "$pkgdir/usr/bin/phpup"

  chmod +x "$pkgdir/opt/phpup"

  mkdir -p "$pkgdir"/usr/share/bash-completion/completions
  mv "$pkgdir/opt/phpup/completions/bash/_phpup" "$pkgdir"/usr/share/bash-completion/completions/phpup

  mkdir -p "$pkgdir"/usr/share/zsh/site-functions
  mv "$pkgdir/opt/phpup/completions/zsh/_phpup" "$pkgdir"/usr/share/zsh/site-functions/_phpup

  mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d
  mv "$pkgdir/opt/phpup/completions/fish/phpup.fish" "$pkgdir"/usr/share/fish/vendor_completions.d/phpup.fish

  rm -r "$pkgdir/opt/phpup/completions"
}
