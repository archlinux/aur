# Maintainer: tarball <bootctl@gmail.com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.16.0
pkgrel=1
pkgdesc='make your ssh client smarter'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/moul/assh'
license=('MIT')
provides=('assh')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/moul/assh/v$pkgver/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver}/assh_${pkgver}_linux_amd64.tar.gz")
source_i686=("$url/releases/download/v${pkgver}/assh_${pkgver}_linux_386.tar.gz")
source_aarch64=("$url/assh/releases/download/v${pkgver}/assh_${pkgver}_linux_arm64.tar.gz")

sha256sums=('123a58223e5ac1d0ded53648643881130a8d1bea7faff755376a4e15b88055ce')
sha256sums_x86_64=('8c1329f23d6a23e1e7318eda09510774512ed0b3fd9e0c7a5b9ee74c8af53572')
sha256sums_i686=('a99939f6a74eb15ca39b6b9ca69a9f41f51a40d2fee4ebe1c1f9ff6b3f47c15c')
sha256sums_aarch64=('7bc8e8c1a14518b0c458c854787e5d106c4442c6fa85db10dfa690456a677498')

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
