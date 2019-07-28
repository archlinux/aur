#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="4.0.11"
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

sha256sums_x86_64=("36f115fee42e3d8b81d72773093b1af4f438ac96f9506fcf2b33a1daa33eeedd")
sha256sums_aarch64=("b7ae156c1b60ef560900a6e4fd65686fd10461aa93c6dc50a0c8b30624a0be61")

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
