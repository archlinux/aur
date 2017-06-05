# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=ctkarch-sysconfig-git
pkgver=1.0.r15.ge81168c
pkgrel=1
pkgdesc='This utility helps with configuring an Arch Linux installation'
arch=('any')
url='http://ctkarch.org/git/sysconfig'
license=('GPL2')
depends=('dialog')
makedepends=('git')
optdepends=('xorg-xinput: support for hot-detecting touchpad capabilities')
source=('git+https://ctkarch.org/git/sysconfig')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/sysconfig"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/sysconfig"
  sed -i "s#^resource_folder=.*\$#resource_folder='/usr/share/ctkarch-sysconfig'#" ctkarch-sysconfig
}

package() {
  cd "${srcdir}/sysconfig"

  # modules
  install -d -m755 "${pkgdir}/usr/share"
  cp -rv share "${pkgdir}/usr/share/ctkarch-sysconfig"
  find "${pkgdir}/usr" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # main executable
  install -D -m755 ctkarch-sysconfig "${pkgdir}/usr/bin/ctkarch-sysconfig"
}
