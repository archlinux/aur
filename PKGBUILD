# Maintainer: Your Name <your.email@example.com>
# NOTE: Update the maintainer information above when publishing to AUR
pkgname=x11-mouse-funnel
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightweight X11 utility that solves the dead corner problem on multi-monitor setups"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/freehuntx/x11-mouse-funnel"
license=('MIT')
depends=('libx11' 'libxi' 'libxrandr')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/freehuntx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ac01e57faf52f5b13d1b399ff2fab90973394d39e748681ae719b71cdd915031')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gcc -O2 -o mouse_funnel mouse_funnel.c -lX11 -lXi -lXrandr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 mouse_funnel "${pkgdir}/usr/bin/mouse_funnel"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
