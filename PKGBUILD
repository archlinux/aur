# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=bookmark-djvu
pkgver=0.1
pkgrel=1
pkgdesc="bookmark-djvu and bookmark-djvu-extract are YAML -enabled wrappers around DjVuLibre’s djvused tool. They allow simple modification and extraction of DjVu outlines."
arch=(any)
url="https://github.com/amba/bookmark-djvu"
license=("GPLv3+")
depends=('djvulibre' 'perl-yaml-libyaml')
source=("${pkgname}.git::git+https://github.com/amba/bookmark-djvu.git")
md5sums=(SKIP)

package() {
   
  mkdir -p $pkgdir/usr/bin/vendor_perl/
  install -D -m 0755 $srcdir/${pkgname}.git/${pkgname} \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}
  install -D -m 0755 $srcdir/${pkgname}.git/${pkgname}-extract \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}-extract
		     
  mkdir -p $pkgdir/usr/bin/vendor_perl/${pkgname}-test
  install -D -m 0644 $srcdir/${pkgname}.git/t/expected1 \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}-test/expected1
  install -D -m 0644 $srcdir/${pkgname}.git/t/input1 \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}-test/input1
  install -D -m 0644 $srcdir/${pkgname}.git/t/input1.yaml \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}-test/input1.yaml
  install -D -m 0755 $srcdir/${pkgname}.git/t/test \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}-test/test
		     
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -D -m 0644 $srcdir/${pkgname}.git/AUTHORS \
		     $pkgdir/usr/share/doc/$pkgname/AUTHORS
  install -D -m 0644 $srcdir/${pkgname}.git/COPYING \
		     $pkgdir/usr/share/doc/$pkgname/COPYING

  install -D -m 0644 $srcdir/${pkgname}.git/README.org \
		     $pkgdir/usr/share/doc/$pkgname/README
  sed -i "s|cd t\/|cd \/usr\/bin\/vendor_perl\/${pkgname}-test|" $pkgdir/usr/share/doc/$pkgname/README
  
  install -D -m 0644 $srcdir/${pkgname}.git/TODO.org \
		     $pkgdir/usr/share/doc/$pkgname/TODO	     
 }
