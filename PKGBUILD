# Maintainer: foo <foo(at)gmail(dot)com>
# Contributor: bar <bar(at)gmai(dot)com>

_pkgbase=tty0tty
pkgname=tty0tty-git
pkgver=git
pkgrel=1
pkgdesc="tty0tty Virtual Serial Cable (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/freemed/tty0tty"
license=('GPL2/Apache2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("git+https://github.com/freemed/tty0tty")
sha256sums=("SKIP")

build() {
  cd ${_pkgbase}
}

package() {
  # Install
  msg2 "Copying DKMS module..."

  # Copy dkms.conf
  install -Dm644 "${_pkgbase}"/debian/tty0tty-dkms.dkms "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
