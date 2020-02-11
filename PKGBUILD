# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-python2
pkgver=3.0
pkgrel=1
pkgdesc="SELinux python 2.X tools and libraries"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python2' 'python2-audit' 'python2-ipy' 'libsemanage>=2.8' 'setools>=4.0.0')
conflicts=('sepolgen<2.7' 'policycoreutils<2.7')
provides=("sepolgen=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/selinux-python-${pkgver}.tar.gz")
sha256sums=('43c08fa881ccc64251d396b1ac6c56b354bf98421b4ec937d54a8db190135494')

build() {
  cd "selinux-python-${pkgver}"
  make PYTHON=/usr/bin/python2
}

package() {
  cd "selinux-python-${pkgver}"
  make PYTHON=/usr/bin/python2 DESTDIR="${pkgdir}" SBINDIR=/usr/bin install
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
  /usr/bin/python2 -O -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
}
