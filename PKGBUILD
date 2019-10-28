# Maintainer: oguzkagan <me@oguzkaganeren.com.tr>
# Forked from https://aur.archlinux.org/packages/owncloud-app-ocsms/
# Original contributors:
# Contributor: Polichronucci <nick at discloud dot eu>

pkgname=nextcloud-app-ocsms-git
pkgver=2.1.3.r12.g7a23294
pkgrel=1
pkgdesc="Push your Android SMS to your Nextcloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
makedepends=('git')
options=('!strip')
source=("git+https://github.com/nextcloud/ocsms")
sha512sums=('SKIP')
provides=("nextcloud-app-ocsms=$pkgver")
conflicts=('nextcloud-app-ocsms')

pkgver() {
  cd ocsms
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Ddm755 "$pkgdir/usr/share/webapps/nextcloud/apps"
  cp -dr --no-preserve=ownership ocsms \
    "$pkgdir/usr/share/webapps/nextcloud/apps/ocsms"

  rm -r "$pkgdir/usr/share/webapps/nextcloud/apps/ocsms/.git"
}
