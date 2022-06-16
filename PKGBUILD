# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

_pkgname=selinux-python
pkgname="${_pkgname}2"
pkgver=3.4
pkgrel=1
pkgdesc="SELinux python 2.X tools and libraries"
groups=('selinux')
arch=('i686' 'x86_64')
_url="https://github.com/SELinuxProject/selinux"
url="${_url}/wiki"
license=('GPL2')
depends=('python2' 'python2-audit' 'python2-ipy' 'libsemanage>=2.8' 'setools>=4.0.0')
conflicts=('sepolgen<2.7' 'policycoreutils<2.7')
provides=("sepolgen=${pkgver}-${pkgrel}")
source=("${_url}/releases/download/${pkgver}/selinux-python-${pkgver}.tar.gz")
sha256sums=("1731065a58293b8a598c0f8b182fdd1a278959b1288747fcb17af392496bac32")

build() {
  cd "${_pkgname}-${pkgver}"
  make PYTHON=/usr/bin/python2
}

package() {
  cd "${_pkgname}-${pkgver}"
  make PYTHON=/usr/bin/python2 DESTDIR="${pkgdir}" SBINDIR=/usr/bin install
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
  /usr/bin/python2 -O -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
}
