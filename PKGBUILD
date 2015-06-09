# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pypy19
pkgver=1.9
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled"
url="http://pypy.org"
arch=('i686' 'x86_64')
depends=('libffi')
provides=('python2')
makedepends=('python2')
optdepends=('openssl: openssl module'
            'expat: pyexpat module'
            'ncurses: ncurses module'
            'zlib: zlib module'
            'bzip2: bz2 module')
license=('custom:MIT')
source=(https://bitbucket.org/pypy/pypy/get/release-${pkgver}.tar.bz2)

build() {
  cd ${srcdir}/pypy-pypy-*/pypy/translator/goal

  python2 translate.py -Ojit
}

package() {
  cd ${srcdir}/pypy-pypy-*/pypy/translator/goal

  install -Dm755 pypy-c ${pkgdir}/opt/pypy-1.9/g/pypy-c
  mkdir -p ${pkgdir}/opt/pypy-1.9/g/{lib-python,pypy}

  cd ${srcdir}/pypy-pypy-* 
  cp -r lib-python/2.7 ${pkgdir}/opt/pypy-1.9/g/lib-python/
  cp -r lib_pypy ${pkgdir}/opt/pypy-1.9/g/
  cp -r include ${pkgdir}/opt/pypy-1.9/g/

  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/pypy-1.9/g/pypy-c ${pkgdir}/usr/bin/pypy-1.9

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/pypy19/LICENSE
}

sha256sums=('9fd599acade49ef98017bbce4f179f19cf2680489ff15235d3bad5b20bde0d68')
