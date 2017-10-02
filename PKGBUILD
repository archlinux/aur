# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Dennis E. Mungai <dmngaie@gmail.com>

pkgname=nvidia-prime
pkgver=0.8.4
pkgrel=1
pkgdesc="Tools to enable NVIDIA's Prime."
url="https://launchpad.net/ubuntu/+source/nvidia-prime"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('lightdm' 'bbswitch' 'python' 'bash')
optdepends=('nvidia' 'lightdm-gtk3-greeter')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('8241ef91d6065b79c58277e3c2bfaf95')

package() {
  cd $pkgname

  #Install PRIME
  install -Dm755 get-quirk-options $pkgdir/usr/bin/get-quirk-options
  install -m755 prime-offload $pkgdir/usr/bin/prime-offload
  install -m755 prime-select $pkgdir/usr/bin/prime-select
  install -m755 prime-supported $pkgdir/usr/bin/prime-supported
  install -m755 prime-switch $pkgdir/usr/bin/prime-switch

  #Add nvidia-prime-quirks
  install -Dm755 prime-quirks $pkgdir/usr/share/nvidia-prime/prime-quirks

  #Add systemD service
  install -Dm644 debian/nvidia-prime.service $pkgdir/usr/lib/systemd/system/nvidia-prime.service

  #Add LightDM
  install -Dm644 90-nvidia.conf $pkgdir/usr/share/lightdm/lightdm.conf.d/90-nvidia.conf

  #Other Information
  install -Dm644 debian/changelog $pkgdir/usr/share/doc/nvidia-prime/changelog.gz
  install -m644 debian/copyright $pkgdir/usr/share/doc/nvidia-prime/copyright
}
