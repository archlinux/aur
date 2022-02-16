# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.31.0
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
sha256sums_x86_64=('18ae70bb09ca7358a23b43da6e83727af4eae13563095c95a9f9bc2769ed01a9')
sha256sums_aarch64=('112e00b7803a4b757f644268cef278a7116c2c381898afff0ad1781e77b578d1')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/$_pkgname"

  mkdir -p \
    "$pkgdir"/usr/share/bash-completion/completions \
    "$pkgdir"/usr/share/fish/vendor_completions.d \
    "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/usr/bin/$_pkgname" completions --shell bash > "$pkgdir"/usr/share/bash-completion/completions/$_pkgname
  "$pkgdir/usr/bin/$_pkgname" completions --shell fish > "$pkgdir"/usr/share/fish/vendor_completions.d/$_pkgname.fish
  "$pkgdir/usr/bin/$_pkgname" completions --shell zsh > "$pkgdir"/usr/share/zsh/site-functions/_$_pkgname
}
