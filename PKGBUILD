# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.30.1
pkgrel=4
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/$_pkgname-arm64.zip")
sha256sums_x86_64=('4b3f2652e658e25bc6e804316698b22305a4d64f764f003a7e2d40eddc293018')
sha256sums_aarch64=('b20a06151e9d0da41a945d49a4d26a7aa2f5be2a262a2744d0a7ec90fb538f11')

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
