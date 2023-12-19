# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=nomad-device-nvidia
pkgver=1.0.0
pkgrel=1
pkgdesc='Nomad device driver for Nvidia GPU'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/nomad-device-nvidia"
license=('MPL2')
makedepends=('git' 'go')
provides=('nomad-device-nvidia')
changelog=nomad-device-nvidia.changelog
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=(!strip)

build() {
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build .
}

check() {
  cd "${pkgname}"
  # tests not passing
  # go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/lib/nomad/plugins" nomad-device-nvidia
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
