# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-ldp-ja
pkgver=3.79
pkgrel=1
pkgdesc="Man pages that is distributed by Linux Documentation Project for Japanese"
arch=('any')
url="http://osdn.jp/projects/linuxjm/"
license=('GPL3' 'custom')
source=('git+http://scm.osdn.jp/gitroot/linuxjm/LDP_man-pages.git')
md5sums=('SKIP')

package() {
  install -D -m644 $srcdir/LDP_man-pages/dist/README "${pkgdir}/usr/share/licenses/${pkgname}/README"
  for i in 1 2 3 4 5 6 7 8; do
    cd $srcdir/LDP_man-pages/release/man${i}
    if [ ! -e "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/" ]; then
      mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
      chmod -R 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
    fi

    # To copy a noexistent man only.
    for f in *.${i} ; do
      if [ ! -e /usr/share/man/ja_JP.UTF-8/man${i}/${f}.gz ]; then
        cp ${f} "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/${f}"
        chmod 644 *.${i}
      fi
    done
  done
}
