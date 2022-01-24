# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=funkin-rewritten
pkgver=1.1.0_beta.2
pkgrel=1
pkgdesc="Optimized rewrite of Friday Night Funkin' built on LÖVE"
arch=("any")
url="https://github.com/HTV04/funkin-rewritten"
license=("GPL3")
depends=("love")
makedepends=("git" "zip")
source=("git+https://github.com/HTV04/funkin-rewritten.git"
        "funkin-rewritten.sh"
        "funkin-rewritten.desktop")
sha256sums=("SKIP"
            "073dc0138f7a3d4686f7a764ad98baf6e2d133de43ee199d8ccd562ba26490d5"
            "7a069ea2dccc9e5eaa18f9415dce2fccb22ded8d0b3b8e89122866829b2ec046")

build() {
  # Build LOVE file
  pushd "${srcdir}/funkin-rewritten" > /dev/null
  make lovefile
  popd > /dev/null
}

package() {
  pushd "${srcdir}/funkin-rewritten" > /dev/null

  # Install funkin-rewritten LOVE file
  install -Dm0644 build/lovefile/funkin-rewritten.love "${pkgdir}/usr/share/${pkgname}/funkin-rewritten.love"
  
  popd > /dev/null

  # Install launcher script as binary
  install -Dm0755 funkin-rewritten.sh "${pkgdir}/usr/bin/${pkgname}"
  
  # Install desktop file
  install -Dm0644 funkin-rewritten.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
