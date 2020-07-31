# Maintainer: zapp-brannigan (fuerst.reinje@web.de)
#             jgottula

pkgname=vdo
pkgrel=1
pkgver=6.2.3.114
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo-dkms' 'python-yaml' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('bb3e537c939214cac97eb344430889a50879f69818267c3f2dab99e5d09927d9')

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
