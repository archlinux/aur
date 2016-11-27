# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.14
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/owncloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'docker')
makedepends=()
options=('!strip')
source=("collaboraonline-${pkgver}.tar.gz::https://github.com/owncloud/richdocuments/archive/${pkgver}.tar.gz")
sha512sums=("5a9379296ac3112b62f805ae4f5273c5c60756e91390de47fd8e834d920a4b47d202223ce75694858b65e1aeaab251aeedecec3dd96e8e08d120b08b887851af")

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
