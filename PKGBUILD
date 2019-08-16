#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="4.2.0"
basever="4.2"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=("x86_64" "aarch64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl")
optdepends=("mongodb-compass: The MongoDB GUI")
source_x86_64=(mongodb-org-tools_${pkgver}_${CARCH}.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-tools_${pkgver}_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_${CARCH}.deb::"https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-org-tools_${pkgver}_arm64.deb")

sha256sums_x86_64=("099fbc4d7704dd7b44b82a12609cf1d0492698dfaa091644049ef8eaa8189e24")
sha256sums_aarch64=("eea48d826ac2a942bd4bd0acd0407dcb79befda4eb95405cdc1cb40e433798ae")

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  rm "$pkgdir/usr/bin/install_compass"
}
