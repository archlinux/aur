# Maintainer: jerry73204 <jerry73204@gmail.com>
_pkgname=pwntools

pkgname=python2-${_pkgname}-git
pkgver=2.2.r401.ga454d54
pkgrel=1
pkgdesc="The CTF framework used by Gallopsled in every CTF."
arch=('any')
url="http://pwntools.com/"
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko'
         'python2-pyserial' 'python2-capstone')
conflicts=('python2-pwntools-git', 'python2-pwntools', 'checksec')
source=("${pkgname}"::'git+https://github.com/Gallopsled/pwntools.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
