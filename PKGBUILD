# This is the PKGBUILD for avalanchego, the go client for the avalanche blockchain

# Maintainer: holisticode <holistic.computing@gmail.com> 
pkgname=avalanchego
pkgver="$(curl --silent "https://api.github.com/repos/ava-labs/avalanchego/releases/latest" | grep tag_name | cut -d\" -f4)"
pkgrel=1
epoch=
pkgdesc="The avalanchego binary"
arch=('x86_64')
url="https://avax.network"
license=('BSD 3-Clause License')
groups=()
depends=('git' 'go' 'gcc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
md5sums=("SKIP" "SKIP")
noextract=()
validpgpkeys=('5395BDA1129CAC3E74699D07D93080B0C0D5FE8B')


source=("https://github.com/ava-labs/avalanchego/releases/download/${pkgver}/avalanchego-linux-amd64-${pkgver}.tar.gz.sig" 
"https://github.com/ava-labs/avalanchego/releases/download/${pkgver}/avalanchego-linux-amd64-${pkgver}.tar.gz")

build() {
  cd "$srcdir"
  tar -zxvf avalanchego-linux-amd64-${pkgver}.tar.gz
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  [[ -f avalanchego ]] && [[ -f plugins/evm ]]
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/local/lib/avalanchego"
  install -d "${pkgdir}/usr/local/lib/avalanchego/plugins"
  install -Dm755 avalanchego ${pkgdir}/usr/local/bin/avalanchego
  install -Dm755 plugins/evm ${pkgdir}/usr/local/lib/avalanchego/evm

}
