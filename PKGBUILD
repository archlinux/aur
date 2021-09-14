# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=pkg
pkgver=5.3.2
pkgrel=1
pkgdesc="Package your Node.js project into an executable"
arch=('x86_64')
url="https://github.com/zeit/pkg"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

#build() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  npm install --prefix "${srcdir}/test" -g
#}

package() {
    #npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    npm install -g pkg@${pkgver} --user root --prefix "${pkgdir}/usr"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

#package() {
#  cd "${srcdir}/${pkgname}"
#  install -d "${pkgdir}/usr/bin"
#  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/"
#  echo -e '#!/usr/bin/bash\nnode /usr/lib/smloadr/SMLoadr.js "$@"' > "${pkgdir}/usr/bin/smloadr"
#  chmod +x "${pkgdir}/usr/bin/smloadr"
#}
