# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.9.3
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("05903caadaab8c7982cb91b1442d617c777a9d97fcd5406d1b404006fa91ef73251852a53a03cb7fcbed097c1120fc920983c1a24a0e8f1f2e95b230153fd26a")

prepare() {
  cd "${srcdir}/tasks-${pkgver}"
  sed -i '3s/tasks/tasks-0.9.3/' Makefile
  sed -i '79s/ $(project_dir)//' Makefile
  sed -i "\$a	\$(project_dir)" Makefile
}

build() {
  cd "${srcdir}/tasks-${pkgver}"
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
  tar -xvf "${srcdir}/tasks-${pkgver}/build/appstore/tasks-${pkgver}.tar.gz" \
      --strip-components=1 \
      -C "${pkgdir}/usr/share/webapps/owncloud/apps/tasks/"
}
