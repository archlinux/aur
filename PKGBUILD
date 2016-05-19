# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.9.0
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("7cde8605f93b82e4e4df8d4d7ddefee24e872482037c9723188d70880ac8bd9fa37277dc74e4394995fa182a53675d87440f8c72f1650f7091ecc0df7adab20c")

prepare() {
  cd "${srcdir}/tasks-${pkgver}"
  sed -i '3s/tasks/tasks-0.9.0/' Makefile
  sed -i '15s/ $(project_dir)//' Makefile
  sed -i "\$a	\$(project_dir)" Makefile
}

build() {
  cd "${srcdir}/tasks-${pkgver}"
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
  tar -xvf "${srcdir}/tasks-${pkgver}/build/artifacts/appstore/tasks-0.9.0.tar.gz" \
      --strip-components=1 \
      -C "${pkgdir}/usr/share/webapps/owncloud/apps/tasks/"
}
