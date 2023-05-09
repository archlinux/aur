# Maintainer: Helg1980 <depositmail@rambler.ru>
pkgname=cine-encoder
_name=${pkgname}
pkgver=3.5.5
pkgrel=1
pkgdesc="Cine Encoder 2023"
arch=(x86_64)
url="https://github.com/CineEncoder/cine-encoder.git"
license=('GPL3')
depends=('gcc' 'qt5-base>=5.15' 'qt5-multimedia>=5.15' 'qt5-svg>=5.15'
  'qt5-x11extras>=5.15' 'libmediainfo>=20.03' 'libxext'
  'ffmpeg>=4.2' 'mkvtoolnix-cli>=49.0' 'intel-media-driver>=22.2'
  'libva-intel-driver>=2.4')
source=("https://github.com/CineEncoder/cine-encoder/archive/3.5.5.tar.gz")
md5sums=('6128d9389113822c1d5e77aa3db0d6e4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5 -o builddir/Makefile app/cine_encoder.pro -spec linux-g++ CONFIG+=qtquickcompiler
  cd "${srcdir}/${pkgname}-${pkgver}/builddir"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/builddir"
  install -Dm755 cine_encoder "$pkgdir"/usr/bin/cine_encoder

  cd "${srcdir}/${pkgname}-${pkgver}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install documentation
  install -Dm644 share/ABOUT -t "${pkgdir}/usr/share/doc/${pkgname}"

  # install .desktop
  install -Dm644 share/cine-encoder.desktop -t "${pkgdir}/usr/share/applications/"
  # install icon
  install -Dm644 share/cine-encoder.png -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  # install sound
  install -Dm644 share/cine-encoder.wav -t "${pkgdir}/usr/share/sounds/"

}
