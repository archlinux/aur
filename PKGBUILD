# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

_pkgname=maintboot
pkgname=python-${_pkgname}-git
pkgver=v0.1.0.r2.g1c5ab87
pkgrel=1
pkgdesc="Runs commands outside of the current OS, with exclusive access to the system and hardware."
url="https://github.com/g2p/maintboot"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('pkg-config' 'python>=3.3' 'git')
provides=('python-maintboot')
source=("git+https://github.com/g2p/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  depends=('python')

  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
