# Maintainer: tarball <bootctl@gmail.com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.17.3
pkgrel=1
pkgdesc='make your ssh client smarter'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/moul/assh'
license=('MIT')
provides=('assh')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/moul/assh/v$pkgver/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver}/assh_${pkgver}_linux_amd64.tar.gz")
source_i686=("$url/releases/download/v${pkgver}/assh_${pkgver}_linux_386.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/assh_${pkgver}_linux_arm64.tar.gz")

sha256sums=('123a58223e5ac1d0ded53648643881130a8d1bea7faff755376a4e15b88055ce')
sha256sums_x86_64=('06a57a26d4110eb7db06bf9d3fcf8a54aae5b3c5205e412c25a510faddbe65ac')
sha256sums_i686=('cdd42cc833ba562359f40709c87ab26627c2c259b7b469409f95766d8a0b77d6')
sha256sums_aarch64=('5f280885875acb81c9eeb2dba8347c6be35bf5a10c0ec05cb9ccf02b58c7f8c7')

prepare() {
  for shell in bash fish zsh; do
    ./assh completion $shell >$pkgname.$shell
  done
}

package() {
  # binary
  install -Dm755 assh -t "$pkgdir/usr/bin"

  # license
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # completions
  install -Dm644 $pkgname.bash "$pkgdir/usr/share/bash-completion/completions/assh"
  install -Dm644 $pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/assh.fish"
  install -Dm644 $pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_assh"
}
