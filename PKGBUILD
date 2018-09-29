# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=nextcloud-app-tasks-git
pkgver=0.9.5.r258.g983d725
pkgrel=1
pkgdesc="Enhanced task app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/tasks"
license=('AGPL')
depends=('nextcloud')
makedepends=('npm' 'zip' 'git' 'phantomjs' 'rsync')
provides=("nextcloud-app-tasks=$pkgver")
conflicts=('nextcloud-app-tasks')
options=('!strip')
source=("git+https://github.com/nextcloud/tasks.git")
sha512sums=('SKIP')

pkgver() {
  cd tasks

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd tasks

  make all appstore
}

package() {
  cd tasks

  install -Ddm755 "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -dr --no-preserve=ownership build/appstore/tasks "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
