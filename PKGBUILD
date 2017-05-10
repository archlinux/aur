# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-samba-ja
pkgver=4.5.0
pkgrel=1
pkgdesc="Japanese man pages for the Samba4"
arch=("any")
url="http://wiki.samba.gr.jp/"
license=("GPL3" "custom")
source=("https://ja.osdn.net/frs/redir.php?m=ymu&f=%2Fsamba-jp%2F66610%2Fsamba-ja-docs-${pkgver}.tar.gz")
md5sums=('afba7311689944ca15bfa34e7c842b72')

package() {
  install -D -m644 ${srcdir}/docs-xml/README  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 ${srcdir}/docs-xml/README  "${pkgdir}/usr/share/licenses/${pkgname}/README"
  install -D -m644 ${srcdir}/docs-xml/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  cd $srcdir/docs-xml/output/manpages
  for i in 1 5 7 8; do
    if [ ! -e "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/" ]; then
      mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
      chmod 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
    fi

    # To copy a noexistent man only.
    for f in *.${i} ; do
      if [ ! -e /usr/share/man/ja_JP.UTF-8/man${i}/${f}.gz ]; then
        install -D -m644 ${f} "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/${f}"
      fi
    done
  done
}
