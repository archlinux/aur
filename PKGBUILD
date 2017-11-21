# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=nextcloud-app-tasks-git
pkgver=v0.9.5.r152.gbf6cdba
pkgrel=1
pkgdesc="Enhanced task app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/tasks"
license=('AGPL')
depends=('nextcloud')
makedepends=()
provides=('nextcloud-app-tasks')
conflicts=('nextcloud-app-tasks')
options=('!strip')
source=("git+https://github.com/nextcloud/tasks.git")
sha512sums=('SKIP')

pkgver() {
  cd "tasks"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's/openssl/#openssl/g' ${srcdir}/tasks/Makefile
}

build() {
  cd "${srcdir}/tasks"
  make
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  tar -xvf "${srcdir}/tasks/build/artifacts/appstore/tasks.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
