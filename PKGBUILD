# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news-git
pkgver=3.001.r2022.g176f17e7
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
provides=('nextcloud-app-news')
conflicts=('nextcloud-app-news')
options=('!strip')
source=("git+https://github.com/nextcloud/news.git")
sha512sums=("SKIP")

pkgver() {
  cd "news"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}/news"
  make
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  tar -xvf "${srcdir}/news/build/artifacts/appstore/news.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
