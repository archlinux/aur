# Maintainer: zapp-brannigan (fuerst.reinje@web.de)
#             jgottula

pkgname=vdo
pkgrel=1
pkgver=8.1.0.316
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL2')
depends=('kvdo-dkms' 'python-yaml' 'device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/vdo/archive/$pkgver.tar.gz")
sha256sums=('f1dd66e7a927e323a5da1ef1c9523af22333ca2873423e7a09110dab73943cd2')

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
