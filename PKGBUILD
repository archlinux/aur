# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=wsl2-ssh-agent
pkgver=0.9.7
pkgrel=1
pkgdesc="A bridge from WSL2 ssh client to Windows ssh-agent.exe service"
arch=('x86_64' 'aarch64')
url="https://github.com/mame/wsl2-ssh-agent"
license=('MIT')
makedepends=('go>=1.18')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mame/wsl2-ssh-agent/archive/v${pkgver}.tar.gz")
sha256sums=('766ee25b4871b56275c7af4677863e981ba9ce0ed809b238baca6edd4162c057')

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-mod=mod -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 $pkgname "$pkgdir"/usr/bin/wsl2-ssh-agent
}
