# Maintainer: Hemanth Bollamreddi <blmhemu (at) gmail (dot) com>

pkgbase=openaero-git
_pkgbase=openaero
pkgname=('openaero-driver-dkms-git' 'openaero-meta-git')
pkgver=0.2.0.beta.r0.g7e76dab
pkgrel=1
pkgdesc="Entirely open source drivers and utilities for your Gigabyte Aero Laptops on GNU/Linux."
arch=('any')
url="https://github.com/blmhemu/openaero"
license=('GPL2')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/blmhemu/openaero.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_openaero-driver-dkms-git() {
  pkgdesc="Kernel driver for Aero devices (DKMS-variant)"
  depends=('dkms' 'udev' 'linux-headers')
  provides=('openaero-driver-dkms')
  conflicts=('openaero-driver-dkms')
  install=openaero-driver-dkms-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" setup_dkms udev_install
}

package_openaero-meta-git() {
  pkgdesc="Meta package for installing all required openaero packages."
  depends=('openaero-driver-dkms')
  provides=('openaero-meta')
  conflicts=('openaero-meta')
}
