# Maintainer: tarball <bootctl@gmail.com>

pkgname=newreleases-bin
pkgver=0.1.16
pkgrel=1
pkgdesc='NewReleases.io CLI'
url='https://newreleases.io'
arch=(i686 x86_64 armv6h aarch64)
provides=(newreleases)
conflicts=(newreleases)
license=(BSD)

_base="https://github.com/newreleasesio/cli-go/releases/download/v$pkgver/newreleases-linux-"

source=("https://raw.githubusercontent.com/newreleasesio/cli-go/v$pkgver/LICENSE")

source_i686=("newreleases-i686-$pkgver::${_base}386")
source_x86_64=("newreleases-x86_64-$pkgver::${_base}amd64")
source_aarch64=("newreleases-aarch64-$pkgver::${_base}arm64")
source_armv6h=("newreleases-armv6h-$pkgver::${_base}armv6")

sha256sums=('05c2be2edf06d243f734ff74f2d2bda6a2f9ec06cb68f95171ae9820a90fa4e0')
sha256sums_i686=('e852d8490bf59ad7f9ca973e1e001a97230154eac3aa928cbdda1613d425aabf')
sha256sums_x86_64=('f991736625c15993c0c0895414a92efc391c15ccd3b0f7a79f0198a85b8943bb')
sha256sums_armv6h=('1239877c16a6b11cd2a6d30ddeedb434b4dfd26d5c003bddaf9ff40c8fe42476')
sha256sums_aarch64=('6352214fc29b3a37192402181db1a4a8e6935c9ac4b13c1e4c31ab5f779cf92e')

prepare() {
  chmod 755 newreleases-$CARCH-$pkgver

  for shell in bash fish zsh; do
    ./newreleases-$CARCH-$pkgver completion $shell >completion.$shell 2>/dev/null || rm -f completion.$shell
  done
}

package() {
  install -Dm755 newreleases-$CARCH-$pkgver "$pkgdir/usr/bin/newreleases"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/newreleases/LICENSE"

  if [[ -f completion.bash ]]; then
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/newreleases"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/completions/newreleases.fish"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_newreleases"
  fi
}
