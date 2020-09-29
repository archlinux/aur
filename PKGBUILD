# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=simplest-studio
_name=${pkgname#cpp-}
pkgver=1.1
pkgrel=1
pkgdesc="Simplest Studio 2020 SE"
arch=(x86_64)
url="https://github.com/SimplestStudio/simplest-studio.git"
license=('GPL')
depends=('ffmpeg>=4.2' 'mediainfo>=20.03')
source=("https://github.com/SimplestStudio/simplest-studio/archive/1.1.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/simplest-studio-${pkgver}/app"
  make -j4
}


package() {
  cd "${srcdir}/simplest-studio-${pkgver}/app"
  make INSTALL_ROOT="$pkgdir" install
  
  cd "${srcdir}/simplest-studio-${pkgver}"
  # install documentation
  install -Dm644 ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install icon
  install -Dm644 app/simplest-studio.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install .desktop
  install -Dm644 app/simplest-studio.desktop -t "${pkgdir}/usr/share/applications/"

}
