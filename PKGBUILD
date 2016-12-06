# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.15
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/owncloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'docker')
makedepends=()
options=('!strip')
source=("collaboraonline-${pkgver}.tar.gz::https://github.com/owncloud/richdocuments/archive/${pkgver}.tar.gz")
sha512sums=("710b521e438fdc3779fbd507bbf0e9ff59c6a71998208dfc19e4442e30eca71482c44600fac2a35fb49e51382933f1bdbc60371a017f8031a5c1de63c1d23f63")

build() {
  cd "${srcdir}/richdocuments-${pkgver}"
  make dist
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
  tar --strip-components=1 -xvf "${srcdir}/richdocuments-${pkgver}/owncloud-collabora-online-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}

# Todo:
# - ArchWiki tutorial
# - systemd unit file to start and enable docker image
