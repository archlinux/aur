# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=streampager
pkgver=0.8.0
pkgrel=1
pkgdesc='A pager for command output or large files'
url='https://github.com/markbt/streampager'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markbt/streampager/archive/v${pkgver}.tar.gz")
sha256sums=('190085dd597a6497c7f95ebcccdf522876e6ed6f7b55a2a9b0b0a3462c235742')
b2sums=('f80cd08deeb4b3ada199327ece56fe18086b8ac36cae7f4e03460addcd0402a875a6589f2267daf80d82bcabc5d6a234fe5f1134ea276afe399711c313626c59')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin" target/release/{sp,spp}

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
