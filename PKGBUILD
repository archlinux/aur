# Maintainer: Roberto Nóbrega <rwnobrega@gmail.com>

pkgname=plsdr-git
_gitname=PLSDR
pkgver=r26.f3b59e2
pkgrel=1
pkgdesc="A powerful Python-based software-defined radio (SDR)"
arch=('any')
url="https://arachnoid.com/PLSDR/index.html"
license=('GPL3')
groups=()
depends=('gnuradio' 'gnuradio-osmosdr' 'python-pyqt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git://github.com/lutusp/${_gitname}.git")
noextract=()
md5sums=('SKIP')


pkgver() {
  cd $srcdir/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir
  sed -i -e 's/env python$/env python2/g' ${_gitname}/*.py
  install -d ${pkgdir}/usr/share/${_gitname}
  cp -r $srcdir/${_gitname}/* ${pkgdir}/usr/share/${_gitname}
  mkdir ${pkgdir}/usr/bin/
  echo "python2 /usr/share/PLSDR/PLSDR.py" > ${pkgdir}/usr/bin/${_gitname}
  chmod +x ${pkgdir}/usr/bin/${_gitname}
}
