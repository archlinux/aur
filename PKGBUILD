#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="4.0.12"
basever="4.0"
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
source_aarch64=(mongodb-org-tools_${pkgver}_${CARCH}.deb::"https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-org-tools_${pkgver}_arm64.deb")

sha256sums_x86_64=("04999e2dbe95d0d0e0025e2253cd061fafdf3099605ae4a846a2c7521bfaf78d")
sha256sums_aarch64=("9c97c479c032e024f658f24e3daf9c9e56caf4f9571bea8ec3b84b3a2ee8234e")

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
