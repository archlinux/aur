# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

_pkgbase=hp-omen-linux-module
pkgname=$_pkgbase-dkms-git
pkgver=r13.9d1edb1
pkgrel=1
pkgdesc='Control the HP Omen keyboard lighting and performance settings in Linux (DKMS) (hp-omen-wmi)'
arch=('any')
depends=('dkms')
url='https://github.com/pelrun/hp-omen-linux-module'
license=('GPL2')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Set version
  sed -e "s/PACKAGE_VERSION=0.9/PACKAGE_VERSION=${pkgver}/" \
      -i "${_pkgbase}/dkms.conf"
}

package() {
  install -dm755 "${pkgdir}/usr/src/"
  cp -ar "${_pkgbase}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  rm -r "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/.git"{,ignore}
  # Set proper permissions
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;
}
