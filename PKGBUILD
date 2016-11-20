# Maintainer: kaptoxic(at)yahoo(dot)com
# Contributor: Paolo Herms

pkgname=z3-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=(i686 x86_64)
url="http://research.microsoft.com/en-us/um/redmond/projects/z3"
license=('MIT')
_arch="x86"
source=("https://github.com/Z3Prover/z3/releases/download/z3-${pkgver}/z3-${pkgver}-x86-ubuntu-14.04.zip")
md5sums=('243d48eb4c3531f323056040b94459ad')
[[ "$CARCH" = x86_64 ]] && {
    source=("https://github.com/Z3Prover/z3/releases/download/z3-${pkgver}/z3-${pkgver}-x64-ubuntu-14.04.zip")
    md5sums=('030fe472df4c6b2f16019e0ef12c8918')
    _arch="x64"
}
depends=('gcc-libs')
makedepends=('git' 'python')
optdepends=('python: bindings for python')
conflicts=('z3' 'z3-git' 'z3-codeplex')
provides=('z3')

package() {
  cd "$srcdir/z3-${pkgver}-${_arch}-ubuntu-14.04"

  install -D ./bin/z3 "$pkgdir"/usr/bin/z3

  # license
  install -m644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # headers
  mkdir "$pkgdir"/usr/include
  install -m644 -D ./include/*.h "$pkgdir"/usr/include/

  # python bindings
  # /usr/lib/python3.5/site-packages
  pypath=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "$pkgdir$pypath"
  #install -m644 -D "./bin/python/z3/{z3consts.py,z3core.py,z3num.py,z3poly.py,z3printer.py,z3.py,z3rcf.py,z3types.py,z3util.py}" "$pkgdir$pypath"
  install -m644 -D ./bin/python/z3/*.py "$pkgdir$pypath"
  rm "$pkgdir$pypath"/__init__.py
}

