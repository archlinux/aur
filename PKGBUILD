# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

_pkgname=blocks
pkgname=python-g2p-${_pkgname}-git
pkgver=167
pkgrel=3
pkgdesc="Enable bcache or LVM on existing block devices. Convert between raw partitions, logical volumes, and bcache devices witout moving data."
url="https://github.com/g2p/blocks"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('pkg-config' 'python>=3.3' 'git')
provides=("python-g2p-${_pkgname}")
source=("git+https://github.com/g2p/${_pkgname}.git")
depends=("python-pyparted" "python-augeas" "python-maintboot-git" "python-setuptools")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
