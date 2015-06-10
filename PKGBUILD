# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=ndsplus-git
pkgver=r8.93f517c
pkgrel=2
pkgdesc="Linux support for the EMS NDS Adapter+."
arch=('i686' 'x86_64')
url="https://github.com/Thulinma/ndsplus"
license=('GPL')
depends=('pkg-config' 'libusb')
makedepends=('git')
provides=('ndsplus')
conflicts=('ndsplus')
source=('git://github.com/Thulinma/ndsplus.git'
        'ndsadapterplus.rules')
sha256sums=('SKIP'
            '03fa9595fbb440bc4d78df2f4655eddb0ad29bc2f2860f2e0dd701a14601c9ac')

pkgver() {
  cd "$srcdir/ndsplus"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/ndsplus"
  make
}

package(){
  cd "$srcdir"
  install -Dm0644 ndsadapterplus.rules "$pkgdir"/etc/udev/rules.d/ndsadapterplus.rules
  cd "ndsplus"
  install -Dm0755 ndsplus "$pkgdir"/usr/bin/ndsplus
}
