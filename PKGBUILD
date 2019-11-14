# Maintainer: oguzkagan <me@oguzkaganeren.com.tr>
# Forked from https://aur.archlinux.org/packages/owncloud-app-ocsms/
# Original contributors:
# Contributor: Polichronucci <nick at discloud dot eu>

pkgname=nextcloud-app-ocsms-git
pkgver=2.1.6
pkgrel=1
pkgdesc="Push your Android SMS to your Nextcloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
makedepends=('git')
options=('!strip')
source=("git+https://github.com/nextcloud/ocsms")
sha256sums=('3c230fa7fd5515996849ee775675aad86cb95fdbb824c18425fbdceb076bce63')
provides=("nextcloud-app-ocsms=$pkgver")
sha256sums=('SKIP')
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
