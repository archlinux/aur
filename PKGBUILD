# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=tanka
pkgver=0.7.0
pkgrel=2
pkgdesc="Flexible, reusable and concise configuration for Kubernetes"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://tanka.dev"
makedepends=('git' 'go')
depends=('diffutils')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)
provides=(tanka)
license=('Apache')
source=("git+https://github.com/grafana/tanka#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/tanka"
  make static
}

package() {
  install -Dm755 "$srcdir/tanka/tk" -t "$pkgdir/usr/bin"

  echo "complete -C /usr/bin/tk tk" | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tk"
  echo "complete -o nospace -C /usr/bin/tk tk" | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tk"
}
