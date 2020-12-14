# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: juan tascon <juantascon __at__ horlux org>

pkgname=mongodb-shell-bin
pkgver=4.4.2
basever() {
  sed 's/\.[[:digit:]]\+$//' <<< "${pkgver}"
}
pkgrel=1
pkgdesc="Mongo shell client only"
arch=("x86_64")
url="https://www.mongodb.com/"
license=("SSPLv1")
provides=("mongodb=$pkgver")
conflicts=("mongodb")
optdepends=("mongodb-tools: The MongoDB tools provide import, export, and diagnostic capabilities")
source=("https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/$(basever)/multiverse/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb" "LICENSE")
sha256sums=('1841a1ef443375b1c38d51399b9c53325b534e42fcd543535a3e8c3ca3947928'
            '09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  ar x mongodb-org-shell_${pkgver}_amd64.deb
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output" #shell extracted
}

package() {
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set tabstop=4 shiftwidth=2 expandtab:
