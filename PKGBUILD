# Maintainer: Your Name <your.email@example.com>
pkgname=popugai-agent
pkgver=1.0.4
pkgrel=1
pkgdesc="A cross-platform SSH agent and key manager with GUI"
arch=('x86_64')
url="https://github.com/Monliker2/popugai-agent" # Replace with actual repo URL
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxext' 'libxxf86vm' 'libglvnd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Monliker2/popugai-agent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6810313ed66ffc9958cd6eff28507a7f1921d0d7589c029e02c866cab620cf2d')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  go build -o popugai-agent ./cmd/popugai-agent
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 popugai-agent "${pkgdir}/usr/bin/popugai-agent"
  # Install desktop entry if needed
  # install -Dm644 popugai-agent.desktop "${pkgdir}/usr/share/applications/popugai-agent.desktop"
}
