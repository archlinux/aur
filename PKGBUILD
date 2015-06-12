# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-copasi-bin
pkgver=4.8
_pkgver=35
pkgrel=1
pkgdesc="Python bindings for the COmplex PAthway SImulator (COPASI)"
arch=('i686' 'x86_64')
url="http://www.copasi.org/"
license=('Artistic 2.0')
depends=('python2>=2.7')

if [ $CARCH == 'i686' ]; then
  _pkgname=copasi${_pkgver}_python27_linux_x86 && \
  source=("http://www.comp-sys-bio.org/mirror.copasi.org/$_pkgname.tar.bz2") && \
  md5sums=('292c9fca6f7d9e0c68cc0c96155f32ea')
elif [ $CARCH == 'x86_64' ]; then
  _pkgname=copasi${_pkgver}_python27_linux_x64 && \
  source=("http://www.comp-sys-bio.org/mirror.copasi.org/$_pkgname.tar.bz2") && \
  md5sums=('67cd2c3d46f52aacd4272d7b915a56fc')
fi

package() {
    cd "$srcdir/$_pkgname"
    pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
    install -Dm755 COPASI.py "$pkgdir/$pydir/COPASI.py"
    install -Dm644 _COPASI.so "$pkgdir/$pydir/_COPASI.so"

    cd "$pkgdir/$pydir"
    python2 -c "import py_compile; py_compile.compile('COPASI.py')"
}
