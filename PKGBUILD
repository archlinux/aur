# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=hakuneko-hg
pkgver=1.4.3.r207.1f84fc28fa17
pkgrel=1
pkgdesc="Manga Downloader for Linux and Windows"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hakuneko/"
license=('MIT')
depends=('curl' 'webkitgtk2' 'wxgtk')
makedepends=('mercurial')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::hg+http://hg.code.sf.net/p/hakuneko/code")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  version=$(grep "VERSION wxT(" src/version.h | awk -F '"' '{print $2}')
  printf "%s.r%s.%s" "$version" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${pkgname%-*}"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname%-*}"
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
