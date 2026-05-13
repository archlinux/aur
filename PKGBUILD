# Maintainer: tarball <bootctl@gmail.com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.17.2
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
sha256sums_x86_64=('aaa8c64da06ecc774780a3325f95efb65f62fd1f6dec0210be9e3aaf79aee6ae')
sha256sums_i686=('a6da34df938263c835b1cb53a3c590f7a64d17ad291d4b359a2e16fe5a100fc6')
sha256sums_aarch64=('e6fd1ee6578b57497b530ffc527487fd972d116560bb2bb6440382e64b12d064')

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
