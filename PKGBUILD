# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=pycrc
pkgver=0.8.3
pkgrel=1
pkgdesc="A free, easy to use Cyclic Redundancy Check (CRC) calculator and C source code generator"
arch=(any)
url="http://www.tty1.net/pycrc/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pycrc.org/download/pycrc-${pkgver}.tar.gz")
sha256sums=('f06da6d049713c5cd6d292aebd09a0325d0832f59e6cf521e4ad4b54de16359c')

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
  install -m644 AUTHORS COPYING "${pkgdir}/usr/share/licenses/pycrc/"
}
