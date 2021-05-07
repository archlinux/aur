# Maintainer: zapp-brannigan (fuerst.reinje@web.de)
#             jgottula

pkgname=vdo
pkgrel=1
pkgver=8.1.0.1
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo-dkms' 'python-yaml' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('38ed568eb9f3bd0ee1c7442b3ca9192427738a83da8df5dfc401a37d7f951051')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" \
       unitdir=/usr/lib/systemd/system \
       presetdir=/usr/lib/systemd/system-preset \
       mandir=/usr/share/man \
       install
  cd $pkgdir
  mkdir -p usr/share/bash-completion/completions
  mv bash_completion.d/* usr/share/bash-completion/completions/
  rmdir bash_completion.d
}
