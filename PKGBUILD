# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks-git
pkgver=9becb08
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=('git')
options=('!strip')
source=("git://github.com/owncloud/tasks.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/tasks"
  rm build.xml CONTRIBUTING.md .gitattributes .gitignore README.md .scrutinizer.yml .travis.yml
}

pkgver() {
  cd "$SRCDEST/tasks"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -r "${srcdir}/tasks" "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
}
