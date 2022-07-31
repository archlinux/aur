# Maintainer: zapp-brannigan (fuerst.reinje@web.de)
#             jgottula

pkgname=vdo
pkgrel=1
pkgver=8.2.0.2
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo-dkms' 'python-yaml' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('e1a114e988e05fd87cb1bf2724ece4fbaa131731db4ba695139a61e928d1fd89')

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
