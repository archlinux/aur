# Maintainer: tarball <bootctl@gmail.com>

pkgname=newreleases-bin
pkgver=0.1.15
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
sha256sums_i686=('d04d4da148f5add846085b2ac9252b98dc350fd2dcb1ee4589341af64be466e6')
sha256sums_x86_64=('64e33a34c985aca9c26836b7f826bbc669ef1e7d08b05e408ae7de2d91418831')
sha256sums_armv6h=('b751c1f92fd8f70a6809fcc05069f3f513c509bcd5248edf37627e4441346ce1')
sha256sums_aarch64=('d818f5974812eed1a8e8ec4b1915de8154b1a1ca3be7490cb0f426a407b5623d')

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
