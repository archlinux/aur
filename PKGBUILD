# Maintainer: tarball <bootctl@gmail.com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.17.4
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
sha256sums_x86_64=('1c98bebe05251724693d6ae7ec911f62e16c955cc09453b14c6c29601b1a372b')
sha256sums_i686=('b27ce59d3c6c0461f43569ad547d0fb259aeb1018c2c8c00605d67025f146dcb')
sha256sums_aarch64=('926effa94b2de72e168390ba2db8626b44c9176ed15a6af21b8bdb11fe643763')

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
