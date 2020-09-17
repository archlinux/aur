# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=simplest-studio
_name=${pkgname#python-}
pkgver=1.0
pkgrel=1
pkgdesc="Simplest Studio 2020 SE"
arch=(x86_64)
url="https://github.com/SimplestStudio/simplest-studio.git"
license=('GPL')
depends=('ffmpeg>=4.2' 'mediainfo>=20.03' 'python>=3.6' 'python-pyqt5' 'python-pymediainfo')
source=("https://github.com/SimplestStudio/simplest-studio/archive/1.0.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/simplest-studio-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/simplest-studio-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build  --optimize=1
  # install documentation
  install -Dm644 ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install icon
  install -Dm644 simplest_studio/simplest-studio.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install .desktop
  install -Dm644 simplest_studio/simplest-studio.desktop -t "${pkgdir}/usr/share/applications/"

}
