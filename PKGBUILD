# Maintainer: Firmy <firmianay@gmail.com>
_pkgname=pwntools

pkgname="python2-${_pkgname}-git"
pkgver=3.12.0beta0.r1.g5c4def05
pkgrel=1
pkgdesc='A CTF framework and exploit development library.'
arch=('any')
url='https://github.com/Gallopsled/pwntools'
license=('GPL2' 'BSD' 'MIT')
makedepends=('lib32-glibc'
             'python2-setuptools')
depends=('python2>=2.7'
         'python2-mako'
         'python2-paramiko'
         'python2-pyelftools'
         'python2-capstone'
         'python2-pyserial'
         'python2-unicorn'
         'python2-intervaltree'
         'python2-pip'
         'python2-requests'
         'python2-psutil'
         'python2-tox'
         'python2-pysocks'
         'python2-dateutil'
         'python2-pygments'
         'python2-pypandoc'
         'python2-packaging'
         'ropgadget')
conflicts=('python2-pwntools-git' 'python2-pwntools')
source=("${pkgname}::git+https://github.com/Gallopsled/pwntools.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1 --only-use-pwn-command
  install -D -m 644 LICENSE-pwntools.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/lib/python*/site-packages/*.{txt,md}
}
# vim:set ts=2 sw=2 et:
