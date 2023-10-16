# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: bitwave <github@oomlu.de>
# Contributor: Stanislas H.B. Sodonon <bidossessi@linuxbenin.com>

pkgname=trelby-git
_pkgname=trelby
pkgver=2.4.9.r0.gd02783b
pkgrel=1
pkgdesc="The free, multiplatform, feature-rich screenwriting program!"
url="https://github.com/limburgher/trelby"
arch=('any')
license=('GPL2')
provides=("${_pkgname}")
depends=(
    'python'
    'python-setuptools'
    'python-lxml'
    'python-wxpython'
    'python-reportlab'
    # 'python-pytest'
)
makedepends=(
    'git'
    # 'libxslt'
)
source=('git+https://github.com/limburgher/trelby.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  cd ${srcdir}/${_pkgname}
  # Force package data inclusion
  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz
  python setup.py sdist

  python setup.py install --root="${pkgdir}"
  install -Dm644 "trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm755 "${pkgdir}/opt/trelby/bin/trelby" "${pkgdir}/usr/bin/trelby"
}
