# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sonerezh-git
_pkgname=sonerezh
pkgver=6.0.2.r3.gd57e367
pkgrel=1
pkgdesc='A self-hosted, web-based application for stream your music, everywhere'
arch=('any')
url='https://www.sonerezh.bzh'
license=('GPL3')
depends=('php' 'php-gd')
optdepends=('mariadb: Database backend')
options=('!strip')
install="${_pkgname}.install"

source=("git+https://github.com/Sonerezh/sonerezh.git"
        "${_pkgname}.install")

sha512sums=('SKIP'
	    'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/webapps/sonerezh"
  cp -r * "${pkgdir}/usr/share/webapps/sonerezh/"

  install -d "${pkgdir}/etc/webapps/sonerezh"

  install -d "${pkgdir}/usr/share/doc/sonerezh"
  #install -Dm644 "${srcdir}/example_nginx_vhost.conf" "${pkgdir}/usr/share/doc/pydio/"
}
