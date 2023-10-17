# Maintainer: tarball <bootctl@gmail.com>

pkgname=newreleases-bin
pkgver=0.1.13
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
sha256sums_i686=('e40ec4897bfec5d61388891d7b94f01490fd594a4ea30f17d955732a12f54188')
sha256sums_x86_64=('5300cdd562cd97c40e0ce1d1b2476cd0a4c26066514cfc31c845b6b9672023ec')
sha256sums_armv6h=('8b6a86838261fd2fd3b61e1f735e927bbf9591b30302d1bac7e74365480e647e')
sha256sums_aarch64=('72bc653f1ec48b2f083532725d46bacbb63052a41da0400c4226558eb20600ae')

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
