# Maintainer: arjan5 <aur@anymore.nl>

pkgname=nextcloud-app-files-external-dropbox-git
pkgver=r50.bf208cd
pkgrel=1
pkgdesc="Dropbox V2 app for Nextcloud"
arch=('any')
url="https://github.com/icewind1991/files_external_dropbox"
license=('AGPL')
depends=('nextcloud>=12')
options=('!strip')
provides=('nextcloud-app-files-external-dropbox')
conflicts=('nextcloud-app-files-external-dropbox')
source=("git+https://github.com/icewind1991/files_external_dropbox.git")
install=$pkgname.install
sha512sums=("SKIP")

pkgver() {
  cd "files_external_dropbox"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/files_external_dropbox"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/files_external_dropbox"
  cp -r "${srcdir}/files_external_dropbox/"* "${pkgdir}/usr/share/webapps/nextcloud/apps/files_external_dropbox/"
  install -D "${srcdir}/files_external_dropbox/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

