# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-calendar-git
pkgver=1.5.7.r59.g10c30e55
pkgrel=1
pkgdesc="Calendar app for nextcloud"
arch=('any')
url="http://nextcloud.com"
license=('AGPL')
depends=('nextcloud')
makedepends=('yarn')
conflicts=('nextcloud-app-calendar')
provides=('nextcloud-app-calendar')
options=('!strip')
source=("git+https://github.com/nextcloud/calendar.git")
sha512sums=('SKIP')

pkgver() {
  cd "calendar"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d "v" -f2
}

build() {
  cd "${srcdir}/calendar"
  make
  make appstore
}

package() {
  install -d "$pkgdir"/usr/share/webapps/nextcloud/apps
  tar -xvf "${srcdir}/calendar/build/artifacts/appstore/calendar.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
