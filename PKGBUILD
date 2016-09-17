# Maintainer: lyoko

pkgname=networkmanager-ssh-git
pkgver=r223.8e78731
pkgrel=1
pkgdesc="SSH VPN support for NetworkManager"
arch=('any')
url="https://github.com/danfruehauf/NetworkManager-ssh"
license=('GPL2')
depends=('networkmanager>=1.1.0'
'libnm-glib>=1.1.0')
optdepends=()
options=()
makedepends=('git' 'make' 'gcc' 'autoconf')
provides=('networkmanager-ssh')

source=($pkgname::'git://github.com/danfruehauf/NetworkManager-ssh.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -fvi || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
