# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=sepolgen
pkgver=2.6
pkgrel=1
pkgdesc="SELinux policy generator"
groups=('selinux')
arch=('any')
url='http://userspace.selinuxproject.org'
license=('GPL')
makedepends=('python2')
depends=('python' 'libselinux')
optdepends=('python2: python2 bindings')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6a327b1576d914e57ad796a541a7a9bcceefb14c445355559993de0fdb8e7a60')

build() {
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2
  make PYTHON=python3
}

package(){
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2 DESTDIR="${pkgdir}" install
  make PYTHON=python3 DESTDIR="${pkgdir}" install
  python2 -m compileall "${pkgdir}/$(python2 -c 'import site; print(site.getsitepackages()[0])')"
  python3 -m compileall "${pkgdir}/$(python3 -c 'import site; print(site.getsitepackages()[0])')"
}
