# Maintainer: colibrisec <noreply@colibrisec.dev>
#
# This file is a template: CI (.github/workflows/release.yml, job
# aur-render) fills in the pkgver and sha256sums placeholders below with
# the release version and a real checksum before every push to
# aur.archlinux.org/ojo.git. Don't hand-edit pkgver/sha256sums here --
# edit the placeholders and let CI fill them in.
pkgname=ojo
pkgver=0.2.4
pkgrel=1
pkgdesc="Security scanner for dependencies, secrets, misconfiguration, and code"
arch=('x86_64' 'aarch64')
url="https://github.com/colibrisec/ojo"
license=('GPL-2.0-only')
makedepends=('go')
provides=('ojo')
conflicts=('ojo-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/colibrisec/ojo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbed879d18408b97a25962482487bc77b9b133c6a6a2ea2981fd3a216cb27bc4')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w -X github.com/colibrisec/ojo/internal/cli.Version=v$pkgver" -o ojo .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ojo "$pkgdir/usr/bin/ojo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
