# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Niels Martignène <niels.martignene@gmail.com>

pkgname=pycrc
pkgver=0.9.2
pkgrel=1
pkgdesc="A free, easy to use Cyclic Redundancy Check (CRC) calculator and C source code generator"
arch=(any)
url="http://www.tty1.net/pycrc/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pycrc.org/download/pycrc-${pkgver}.tar.gz")
sha256sums=('84aebcd36304c0fd28ecf64df3888d69a2b9895759c83cf90f55afc9eff4e352')

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
