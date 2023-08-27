# Maintainer: tarball <bootctl@gmail.com>

pkgname=newreleases-bin
pkgver=0.1.12
pkgrel=1
pkgdesc='NewReleases.io CLI'
url='https://newreleases.io'
arch=(i686 x86_64 armv6h aarch64)
provides=(newreleases)
conflicts=(newreleases)
license=(BSD)

_base="https://github.com/newreleasesio/cli-go/releases/download/v$pkgver/newreleases-linux-"

source=("https://raw.githubusercontent.com/newreleasesio/cli-go/v$pkgver/LICENSE")

source_i686=("newreleases-i686::${_base}386")
source_x86_64=("newreleases-x86_64::${_base}amd64")
source_aarch64=("newreleases-aarch64::${_base}arm64")
source_armv6h=("newreleases-armv6h::${_base}armv6")

sha256sums=('05c2be2edf06d243f734ff74f2d2bda6a2f9ec06cb68f95171ae9820a90fa4e0')
sha256sums_i686=('6098b1d97fd55ffd43e966e62197e2af85f612839779637299c1d50dae05e1f5')
sha256sums_x86_64=('4cbf91a47672be51c2adff36e3474d1d04412a5feac2e953a5a0dd60640e0ead')
sha256sums_armv6h=('352e8bd2c4ebf61d15392e49a180c0f273f7d16925805f6e7e4a1aec7bf92441')
sha256sums_aarch64=('2da6715d09e6f2c4543a68053557c1d2a94df203db9e523a575c18e8134ac3a8')

prepare() {
  chmod 755 newreleases-$CARCH

  for shell in bash fish zsh; do
    ./newreleases-$CARCH completion $shell >completion.$shell 2>/dev/null || rm -f completion.$shell
  done
}

package() {
  install -Dm755 newreleases-$CARCH "$pkgdir/usr/bin/newreleases"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/newreleases/LICENSE"

  if [[ -f completion.bash ]]; then
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/newreleases"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/completions/newreleases.fish"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_newreleases"
  fi
}
