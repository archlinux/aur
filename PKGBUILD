# Maintainer: Charles Wise <charles at charlesbwise dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sonerezh-git
_pkgname=sonerezh
pkgver=r230.519c0f8
pkgrel=1
pkgdesc='A self-hosted, web-based application for stream your music, everywhere'
arch=('any')
url='https://www.sonerezh.bzh'
license=('GPL3')
depends=('php' 'php-gd')
optdepends=('mariadb: Database backend' 
	    'libav-git-no-libs: Music transcoding' 
	    'ffmpeg: Music transcoding')
options=('!strip')

source=("git+https://github.com/Sonerezh/sonerezh.git"
        "example_nginx_vhost.conf")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

sha512sums=('SKIP'
	    '806f9aca27da55cd33b814b283bf3e33c32687858258755a43eb2d4b18f62b4ccf81e82dbc8e78c0923e5b48281adb2b33ec7db9850b79fb1ba63b611bbe9ee0')

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/webapps/sonerezh"
  cp -r * "${pkgdir}/usr/share/webapps/sonerezh/"

  install -d "${pkgdir}/etc/webapps/sonerezh"

  install -d "${pkgdir}/usr/share/doc/sonerezh"
  install -Dm644 "${srcdir}/example_nginx_vhost.conf" "${pkgdir}/usr/share/doc/sonerezh/"
}
