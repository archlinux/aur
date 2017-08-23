# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-mail-git
pkgver=0.2.0.r1546.g975f3b21
pkgrel=1
pkgdesc="An email app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/mail"
license=('AGPL')
makedepends=('npm' 'nodejs' 'php' 'mercurial')
depends=('nextcloud')
options=('!strip')
provides=('nextcloud-app-mail')
conflicts=('nextcloud-app-mail')
source=("git+https://github.com/nextcloud/mail.git")
sha512sums=("SKIP")

pkgver() {
  cd "mail"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${srcdir}/mail"
  make install-composer-deps
  make optimize-js
  make appstore
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  tar -xvf "${srcdir}/mail/build/artifacts/mail.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${pkgdir}/usr/share/webapps/nextcloud/apps/mail/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
