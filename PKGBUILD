# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonpaper
pkgver=0.1.3
pkgrel=1
pkgdesc="HUSH paper wallet generator"
url="https://git.hush.is/hush/SilentDragonPaper"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4fade10114af3f0c83d87b93b95e5164692b16611fae4fd80fa2d39fa460c76b')

build() {
  tar xzvf v$pkgver.tar.gz
  cd ${pkgname}/cli
  cargo build --release
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
 
  cd ${pkgname}
  install -m 644 README.md "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  cd cli/target/release
  mv SilentDragonPaper ${pkgname}
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  
  ln -s /opt/${pkgname}/silentdragonpaper "${pkgdir}/usr/bin"
}
