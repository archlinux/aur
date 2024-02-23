pkgname=brainworkshop
pkgver=5.0.3
pkgrel=1
pkgdesc="Brain Workshop is a free open-source version of the Dual N-Back mental exercise"
arch=('any')
url="https://github.com/samcv/brainworkshop"
license=('GPL')
depends=('python-pyglet' 'openal' 'ffmpeg')
install='brainworkshop.install'
source=("https://github.com/samcv/brainworkshop/archive/v${pkgver}.tar.gz"
        brainworkshop.sh
        brainworkshop.desktop)
sha256sums=('81fcdde02c34fb057801e9692189ee934e5afea7d475685480cc34d5a4db9c90'
            '213d8d5763f29da5f3ec65811e9c63052ca615cf770233957ed8bc9e3b43557c'
            '1e645c18ce0648f82285da25a5bbbad1e63e282bfe9d5c31329eb9d04c23f21c')

package() {
  #Data
  _datadir="${pkgdir}/usr/share/brainworkshop"
  install -d ${_datadir}
  cp -a ${srcdir}/brainworkshop-${pkgver}/{brainworkshop.py,res,data} ${_datadir}

  #Docs
  _docdir=${pkgdir}/usr/share/doc/brainworkshop
  install -d "${_docdir}"
  install -D -m644 "${srcdir}/brainworkshop-${pkgver}/Readme.md" "${_docdir}"

  #Launcher and Icon
  install -Dm75 "${srcdir}/brainworkshop.sh" "${pkgdir}/usr/bin/brainworkshop"
  install -D -m644 "${srcdir}/brainworkshop.desktop" "${pkgdir}/usr/share/applications/brainworkshop.desktop"
  install -D -m644 "${srcdir}/brainworkshop-${pkgver}/res/misc/brain/brain.png" "${pkgdir}/usr/share/pixmaps/brainworkshop.png"
}
