# $Id$
# Maintainer: Pierre Metzner <openhab.doc@web.de>
# Contributor: 
# Contributor: 
# Contributor: 
# Contributor: 

pkgname=docbook-xsl-ns
pkgver=1.79.2
pkgrel=1
pkgdesc='The recommended namespaced XML stylesheets for Docbook5 transformations'
arch=(any)
license=(custom)
url='http://docbook.org/'
depends=(libxml2 libxslt sed)
install="$pkgname.install"
source=("https://github.com/docbook/xslt10-stylesheets/releases/download/release%2F$pkgver/docbook-xsl-$pkgver.tar.gz")
sha256sums=('966188d7c05fc76eaca115a55893e643dd01a3486f6368733c9ad974fcee7a26')
md5sums=('3eb1152abf2ab3ae01188ccf81e9a252')

package() {
  cd docbook-xsl-$pkgver

  _pkgroot="$pkgdir"/usr/share/xml/docbook/xsl-ns-stylesheets-$pkgver

  install -dm755 ${_pkgroot}
  install -m644 VERSION VERSION.xsl ${_pkgroot}

  for fn in assembly common eclipse epub epub3 fo highlighting html htmlhelp javahelp lib \
      manpages params profiling roundtrip template website xhtml xhtml-1_1 xhtml5; do
          echo "----- Info -----"
	  echo ${_pkgroot}
	  echo ${fn}
	  echo "---Info Ende ---"
          install -dm755 ${_pkgroot}/${fn}
	  install -m644 ${fn}/*.{xml,xsl,dtd,ent} ${_pkgroot}/${fn} || true  # ignore missing files
  done

  install -dm755 "$pkgdir"/etc/xml
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
