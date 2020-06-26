# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-git
pkgver=v0.10.0.r11.g62b18e4
pkgrel=0
pkgdesc="Flexible, reusable and concise configuration for Kubernetes using Jsonnet"
arch=('i686' 'x86_64' 'arm' 'aarch64')

url="https://tanka.dev"
license=('Apache')
source=("git+https://github.com/grafana/tanka.git")

makedepends=('git' 'go')
depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)

provides=(tanka)
conflicts=(tanka-bin)

md5sums=('SKIP')

function pkgver() {
  cd "$srcdir/tanka"
    (
      set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "$srcdir/tanka"
  make static
}

package() {
  install -Dm755 "$srcdir/tanka/tk" -t "$pkgdir/usr/bin"
}
