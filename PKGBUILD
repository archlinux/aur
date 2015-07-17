# Maintainer: Robin Nehls <aur@manol.is>

pkgname=buttersink-git
_gitname=buttersink
pkgver=0.6.r2.g2ad4585
pkgrel=1
pkgdesc="Buttersink is like rsync for btrfs snapshots"
arch=('any')
url="https://github.com/AmesCornish/buttersink.git"
license=('GPL3')
depends=('btrfs-progs' 'python2-boto' 'python2-crcmod' 'python2-flake8' 'python2-psutil')
conflicts=('buttersink')
provides=('buttersink')
source=('git+https://github.com/AmesCornish/buttersink.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  echo "version = \"$(git describe --tags)\"" > buttersink/version.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root "${pkgdir}"
}
