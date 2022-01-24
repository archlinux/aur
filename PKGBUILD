# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=funkin-rewritten
pkgver=1.1.0_beta.2
pkgrel=2
pkgdesc="Optimized rewrite of Friday Night Funkin' built on LÖVE"
arch=("any")
url="https://github.com/HTV04/${pkgname}"
license=("GPL3")
depends=("love")
makedepends=("git" "zip")
source=("git+https://github.com/HTV04/${pkgname}.git?tag=v${pkgver//_/-}"
        "${pkgname//-/_}.svg"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=("SKIP"
            "2ea6c47142059be0ee1d26faa0b708d4cc3a3bd910990662bf2c1a34de5359ac"
            "073dc0138f7a3d4686f7a764ad98baf6e2d133de43ee199d8ccd562ba26490d5"
            "d35252269bf75fbbd1d30708f259c74efcdaec41bb6cb017b83e7588c2e41b0c")

build() {
  # Build LOVE file
  pushd "${srcdir}/${pkgname}" > /dev/null
  make lovefile
  popd > /dev/null
}

package() {
  # Install funkin-rewritten LOVE file
  install -Dm0644 "${srcdir}/${pkgname}/build/lovefile/funkin-rewritten.love" "${pkgdir}/usr/share/${pkgname}/funkin-rewritten.love"

  # Install icon
  install -Dm0644 ${pkgname//-/_}.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname//-/_}.svg"
  
  # Install launcher script as binary
  install -Dm0755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  
  # Install desktop file
  install -Dm0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
