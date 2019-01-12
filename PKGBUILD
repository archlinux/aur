# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

_pkgname=proxychains-ng
pkgname=$_pkgname-git
pkgver=4.13.r10.g1198857
pkgrel=1
pkgdesc="A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies"
arch=('x86_64')
url="https://github.com/rofl0r/proxychains"
license=('GPL')
provides=('proxychains' 'proxychains-ng')
replaces=('proxychains')
conflicts=('proxychains')
depends=('glibc')
backup=('etc/proxychains.conf')
source=("git+https://github.com/rofl0r/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd $_pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-config
  ln -s proxychains4 "$pkgdir/usr/bin/proxychains"
}

# vim:set ts=2 sw=2 et:

 
