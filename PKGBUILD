# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=phpup-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Cross-Platform PHP version manager written in rust"
arch=("x86_64")
url="https://github.com/masan4444/phpup"
license=("MIT")
provides=("phpup")
conflicts=("phpup" "phpup-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/phpup-linux.zip")
sha256sums=('1ed9854816df2604e4173910c08254a413b39660a21fb850da3ab5afb29bb219')

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

  rm -r "$pkgdir/opt/phpup/completions"
}
