# Maintainer: Norbert Schulz <haju.schulz@online.de>
# Contributer: Stefan Springer <stefanspr94@gmail.com>
# Contributor: Daniel Landau <daniel+aur@landau.fi>
# Contributor: Paul Burton <paulburton89@gmail.com>
# Contributor: Hervé Cauwelier <herve@oursours.net>
# Contributor: MagicFish1990 <magicfish1990@gmail.com>

pkgname=nvidia-bl-dkms
pkgver=18.11.0
pkgrel=3
pkgdesc="Driver to adjust display backlight on legacy mobile NVidia graphics adapters - DKMS edition."
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux>=3.8' 'dkms')
makedepends=('linux-headers')
conflicts=('nvidia-bl')
install=nvidia-bl-dkms.install
backup=('etc/modprobe.d/nvidia_bl.conf')
source=('nvidia_bl.c'
        'Makefile'
        'nvidia_bl.conf'
        'nvidia_bl_ml.conf'
        'dkms.conf')
md5sums=('249c858ada7c9de060af2390ebe559df'
         'ab33e47171098009a47d11574bbc6ebd'
         '897ee78c30e6b498d0e3ce07c06dabc5'
         '5771d2ea826f76d8f27bd9fdcb78a76f'
         'b5547c594e8c2d72620e95888bd79d7f')
package() {

  cd "${srcdir}"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf
  
  mkdir -p "${pkgdir}"/usr/src/nvidia-bl-"${pkgver}"/
  mkdir -p "${pkgdir}"/etc/modprobe.d/
  mkdir -p "${pkgdir}"/etc/modules-load.d/
  install -m 644 nvidia_bl.conf "${pkgdir}"/etc/modprobe.d/nvidia_bl.conf
  install -m 644 nvidia_bl_ml.conf "${pkgdir}"/etc/modules-load.d/nvidia_bl_ml.conf
  install -m 644 dkms.conf "${pkgdir}"/usr/src/nvidia-bl-"${pkgver}"/dkms.conf
  install -m 644 nvidia_bl.c "${pkgdir}"/usr/src/nvidia-bl-"${pkgver}"/nvidia_bl.c
  install -m 644 Makefile "${pkgdir}"/usr/src/nvidia-bl-"${pkgver}"/Makefile
}
