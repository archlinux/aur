# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-contacts-git
pkgver=3.0.1.r1448.g4bec35b0
pkgrel=1
pkgdesc="Contacts app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/contacts"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
provides=('nextcloud-app-contacts')
conflicts=('nextcloud-app-contacts')
source=("git+https://github.com/nextcloud/contacts.git")
sha512sums=('SKIP')

pkgver() {
  cd "contacts"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${srcdir}/contacts"
  make
  make build-js-production
}

check() {
  cd "${srcdir}/contacts"
  macke test
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  tar -xvf "${srcdir}/contacts/build/artifacts/appstore/contacts.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${srcdir}/contacts/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
