# Contributor: aking9 <arking@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=cfg2html-linux-git
pkgrel=3
pkgver=r520.b479f8d
pkgdesc='script similar to getsysinfo or get_config that creates HTML/ASCII system documentation'
arch=('any')
url="https://www.cfg2html.com"
license=('gpl3')
depends=('setserial' 'python' 'make')
makedepends=('git')
md5sums=('SKIP')

source=("${pkgname}"::'git+https://github.com/cfg2html/cfg2html.git')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=$pkgdir deb || true
  mkdir -p ${pkgdir}/usr/{share/,bin}
  cd ${pkgdir}/usr/share/
  tar xvzf ${srcdir}/${pkgname}/cfg2html-*.tar.gz
  ln -s /usr/share/${pkgname}/cfg2html-6.26-git201507271721/cfg2html ${pkgdir}/usr/bin/cfg2html
}
