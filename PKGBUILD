# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.9.1
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("13f383251ee16b59f5dfb17a370df824fcb647760179949537616684c5e663079194dae6190c60cacc5f3bffa44797baaef21808bc4930fe893172fe47f3392e")

prepare() {
  cd "${srcdir}/tasks-${pkgver}"
  sed -i '3s/tasks/tasks-0.9.1/' Makefile
  sed -i '15s/ $(project_dir)//' Makefile
  sed -i "\$a	\$(project_dir)" Makefile
}

build() {
  cd "${srcdir}/tasks-${pkgver}"
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
  tar -xvf "${srcdir}/tasks-${pkgver}/build/artifacts/appstore/tasks-0.9.1.tar.gz" \
      --strip-components=1 \
      -C "${pkgdir}/usr/share/webapps/owncloud/apps/tasks/"
}
