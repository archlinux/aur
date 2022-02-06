# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Schubert <mschu.dev at gmail>
_base=copasi
pkgname=python2-${_base}-bin
pkgver=4.34.251
pkgrel=1
pkgdesc="Python bindings for the COmplex PAthway SImulator (COPASI)"
arch=('i686' 'x86_64')
url="http://${_base}.org"
license=('custom:Artistic 2.0')
depends=('python2>=2.7')
_wheel="python_${_base}-${pkgver}-cp27-cp27m-manylinux_2_5_${CARCH}"
source=(https://pypi.org/packages/cp27/p/python-${_base}/${_wheel}.manylinux1_${CARCH}.whl)
if [ $CARCH == 'i686' ]; then
  sha256sums=('c7bb56b093088fc967318ab3a31a4b0016cd93276f9616657ddbdcd7199d79b4')
elif [ $CARCH == 'x86_64' ]; then
  sha256sums=('0d6b2b622566d77aac72d951542530c1fcadba6efefe7815fee38d049b7e1481')
fi

package() {
  cd ${_base^^}
  pydir=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")
  install -Dm644 __init__.py "${pkgdir}/${pydir}/${_base^^}/__init__.py"
  install -Dm644 _COPASI.so "${pkgdir}/${pydir}/${_base^^}/_${_base^^}.so"
  # cd "$pkgdir/$pydir"
  # python2 -c "import py_compile; py_compile.compile('COPASI.py')"
}
