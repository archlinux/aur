# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=pycrc
pkgver=0.8.2
pkgrel=1
pkgdesc="A free, easy to use Cyclic Redundancy Check (CRC) calculator and C source code generator"
arch=(any)
url="http://www.tty1.net/pycrc/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("http://sourceforge.net/projects/pycrc/files/pycrc/pycrc-${pkgver}/pycrc-${pkgver}.tar.gz")
sha256sums=('3bc8b65d3451b393daae7c50b86a5e4fb5a0ee0a49321847fcbc4aa734b9d667')

_sitedir=`python -c "import site; print(site.getsitepackages()[0])"`

package() {
  cd "pycrc-${pkgver}"

  mkdir -p "${pkgdir}${_sitedir}/pycrc"
  cp -r *.py "${pkgdir}${_sitedir}/pycrc"

  mkdir -p "${pkgdir}/usr/bin"
  chmod +x "${pkgdir}${_sitedir}/pycrc/pycrc.py"
  ln -s "${_sitedir}/pycrc/pycrc.py" "${pkgdir}/usr/bin/pycrc"

  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -m644 doc/pycrc.1 "${pkgdir}/usr/share/man/man1/"

  mkdir -p "${pkgdir}/usr/share/licenses/pycrc/"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/pycrc/"
}
