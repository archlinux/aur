pkgname=factorio-demo
pkgver=2.0.76
pkgrel=2
pkgdesc="A game in which you build and maintain factories"
arch=(x86_64)
url="http://www.factorio.com/"
license=(LicenseRef-factorio)
depends=(glibc)
makedepends=(xz)
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
source=(factorio-demo_linux_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux64
        factorio.desktop
        LICENSE
)
sha256sums=('d5caee49636290b678d35adc59d2fc80ecbdbad8bf420731f1317971c89f941b'
            '8b5d83c82c2b93b7765e6a51abca11dd53858a47a5bb5c5a36591b8dec9173a6'
            '02b42f985d69541660200cd286642b3e9c9af070f95b95588910c9bf93044aa7')

package() {
  cd "${srcdir}"

  install -Dm644 factorio.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd factorio
  install -Dm755 bin/x64/factorio -t "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share/factorio"
  cp -r data/* "${pkgdir}/usr/share/factorio"
}

check() {
  cd "${srcdir}/factorio"
  ./bin/x64/factorio --version
}
