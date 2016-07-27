# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.9.2
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("2090c89e8b3cc6a0f567d8e30c37119d82cca3cba6d9df1f7c24fa96ae355b2eb5303ab677408800567f617c9ac180dcfb792fb242d3c267e1d3b401e4a8d7b8")

prepare() {
  cd "${srcdir}/tasks-${pkgver}"
  sed -i '3s/tasks/tasks-0.9.2/' Makefile
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
