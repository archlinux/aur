# Maintainer: tarball <bootctl@gmail.com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.17.1
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
sha256sums_x86_64=('55714b2c1ed289b260787fe86dca8e4265a5d2b404fbd9416140f3f6c6938088')
sha256sums_i686=('c2deb35a3e07c256f1153e901a4c119e33d5a74908219db85b77c3f02074eb33')
sha256sums_aarch64=('928cd8e56c7822f3bd25e1111c7bfffa7c7fb7ee79740d66d42bbd28dc08b93f')

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
