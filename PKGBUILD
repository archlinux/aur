# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=pkg
pkgver=4.4.9
pkgrel=1
pkgdesc="Package your Node.js project into an executable"
arch=('x86_64')
url="https://github.com/zeit/pkg"
license=('MIT')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeit/pkg/archive/${pkgver}.tar.gz")
sha512sums=('9b20e22abd4a64f8d17100ab6757d750a37db744a9cb0d40e0c93812d7045bf51cfe43176825015b0c2846fdbfc694f0d31ba556ff538567e1387ac4608dfd32')
noextract=("${pkgname}-${pkgver}.tar.gz")

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
