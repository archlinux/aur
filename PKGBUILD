pkgname=brainworkshop-git
pkgver=r236.c9548bd
pkgrel=1
pkgdesc="Brain Workshop is a free open-source version of the Dual N-Back mental exercise"
arch=('any')
url="https://github.com/samcv/brainworkshop"
license=('GPL')
depends=('python-pyglet' 'openal' 'ffmpeg')
makedepends=('git')
install='brainworkshop.install'
provides=('brainworkshop')
conflicts=('brainworkshop')
source=("git+https://github.com/samcv/brainworkshop.git"
        brainworkshop.sh
        brainworkshop.desktop)
sha256sums=('SKIP'
            '95f09471b03db40eb23d48584c43f398800ae2141b6c69b8ebf926aedb531a92'
            '1e645c18ce0648f82285da25a5bbbad1e63e282bfe9d5c31329eb9d04c23f21c')

pkgver() {
  cd "$srcdir/brainworkshop"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "${srcdir}/brainworkshop"
}

package() {
  #Data
  _datadir="${pkgdir}/usr/share/brainworkshop"
  install -d ${_datadir}
  cp -a ${srcdir}/brainworkshop/{brainworkshop.py,res,data} ${_datadir}

  #Docs
  _docdir=${pkgdir}/usr/share/doc/brainworkshop
  install -d "${_docdir}"
  install -D -m644 "${srcdir}/brainworkshop/Readme.md" "${_docdir}"

  #Launcher and Icon
  install -Dm75 "${srcdir}/brainworkshop.sh" "${pkgdir}/usr/bin/brainworkshop"
  install -D -m644 "${srcdir}/brainworkshop.desktop" "${pkgdir}/usr/share/applications/brainworkshop.desktop"
  install -D -m644 "${srcdir}/brainworkshop/res/misc/brain/brain.png" "${pkgdir}/usr/share/pixmaps/brainworkshop.png"
}
