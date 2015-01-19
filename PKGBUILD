# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
_pkgname=pwntools
pkgname=python2-${_pkgname}-git
pkgver=2.2.r116
pkgrel=2
pkgdesc="The CTF framework used by Gallopsled in every CTF."
arch=('any')
url="http://pwntools.com/"
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko'
         'python2-pyserial' 'python2-capstone')
provides=('python2-pwntools')
conflicts=('python2-binjitsu')
replaces=('python2-binjitsu')
options=(!emptydirs)
source=("${pkgname}"::'git+https://github.com/Gallopsled/pwntools.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | cut -f1-3 -d.
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -e 's/capstone==2.1/capstone/g' -i setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
