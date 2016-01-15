# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=man-pages-samba-ja
pkgver=4.1.8
pkgrel=1
pkgdesc="Man pages for the Samba4"
arch=("any")
url="http://wiki.samba.gr.jp/"
license=("GPL3" "custom")
source=("http://osdn.jp/frs/redir.php?m=jaist&f=%2Fsamba-jp%2F61467%2Fsamba-ja-docs-manpages-${pkgver}-1.tar.gz")
md5sums=('bf873a17313148a5aeddd7a139d5d803')

package() {
  install -D -m644 ${srcdir}/docs-xml/README "${pkgdir}/usr/share/licenses/${pkgname}/README"
  install -D -m644 ${srcdir}/docs-xml/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  cd $srcdir/docs-xml/output/manpages
  for i in *.[1-9] ; do
    tar cvfz ${i}.gz ${i}
  done
  for f in 1 5 7 8; do
    mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${f}/"
    chmod -R 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${f}/"
    cp *.${f}.gz "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${f}/"
    chmod 644 *.${f}.gz
  done

}
