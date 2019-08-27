# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=rx
pkgver=0.1.0
pkgrel=3
pkgdesc='A modern and extensible pixel editor implemented in rust.'
arch=(i686 x86_64)
url='http://cloudhead.io/rx/'
license=('GPL3')
makedepends=('clang' 'rust')
source=("https://github.com/cloudhead/rx/archive/v${pkgver}.tar.gz"
        'http://cloudhead.io/rx/palettes/sweetie16.palette')
sha256sums=('b5b413d7a4bb3921f6a471dcc0767eee31275ede548ccc59216231c8b2702b26'
            '17f4f037dbcedbed12c650a68cf2af372fdcd4541a2b23ae40d378d12d491ff4')

build() {
  cd "${pkgname}-${pkgver}"
  patch -p0 < ../../init.tx.patch
  cargo +stable build --release --features vulkan
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/rx/palettes"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/target/release/rx"
  install -Dm644 -t "${pkgdir}/usr/share/rx/palettes" "sweetie16.palette"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "../rx.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "../rx.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "../rx.png"
}
