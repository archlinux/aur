# Maintainer: Aspenini <aspeninifeltner@gmail.com>

pkgname=dirhop
pkgver=0.1.0
pkgrel=1
pkgdesc='Tiny keyboard-driven terminal directory navigator'
arch=('x86_64' 'aarch64')
url='https://github.com/Aspenini/dirhop'
license=('MIT')
depends=('glibc')
makedepends=('xmake')
conflicts=('dirhop-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmake f -y -m release
  xmake -y
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local binary
  binary=$(find build -type f -name dho -print -quit)
  [[ -n "$binary" ]] || return 1

  install -Dm755 "$binary" "${pkgdir}/usr/bin/dho"
  install -Dm644 shell/dirhop.bash "${pkgdir}/usr/share/dirhop/dirhop.bash"
  install -Dm644 shell/dirhop.fish "${pkgdir}/usr/share/dirhop/dirhop.fish"
  install -Dm644 shell/dirhop.fish "${pkgdir}/usr/share/fish/vendor_functions.d/dho.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
