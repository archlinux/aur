# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-postgresql-ja
pkgver=15.0
pkgrel=2
pkgdesc="Japanese man pages for PostgreSQL"
arch=("any")
url="https://pgsql-jp.github.io/"
license=("custom")
source=("${url}jpug-doc/${pkgver}/man.tar.gz")
md5sums=('43a4d2049c28c4e038670b798f9fecef')

package() {
  _license_url="https://www.postgresql.jp/document/15/html/legalnotice.html"
  _destdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${_destdir}"
  curl -Ls "${_license_url}" -o "${_destdir}/legalnotice.html"

  cd ${srcdir}
  for i in 1 3 7; do
    if [ ! -e "${pkgdir}/usr/share/man/ja/man${i}/" ]; then
      install -d "${pkgdir}/usr/share/man/ja/man${i}/"

      # To copy a noexistent man only.
      for f in man${i}/*.${i} ; do
      	  if [ ! -e "/usr/share/man/ja/${f}" ]; then
      	  install -D -m644 ${f} "${pkgdir}/usr/share/man/ja/${f}"
	  fi
      done
    fi
  done
}
