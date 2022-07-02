# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-plugin-godiag
pkgver=2016.02.03
pkgrel=1
pkgdesc="create board setting diagrams for the Asian game Go"
arch=('any')
url="http://www.dokuwiki.org/plugin:godiag"
license=('GPL2')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/splitbrain/dokuwiki-plugin-godiag/archive/refs/tags/${pkgver//./-}.tar.gz")
sha512sums=('e60766b02c2e8930bc04fb22b44c7e7b14877b4833e7ed6adc58b213b837f16b5ac438eb9e8be09a9b2abab5cc121d4d539f66cebb842894aab30f0b76079fd6')

prepare() {
  cd "${srcdir}/dokuwiki-plugin-godiag-${pkgver//./-}"
  patch -p1 <<EOF
diff -wbBur dokuwiki-plugin-godiag-2016-02-03/fetch.php dokuwiki-plugin-godiag-2016-02-03.my/fetch.php
--- dokuwiki-plugin-godiag-2016-02-03/fetch.php	2016-07-06 21:43:18.000000000 +0300
+++ dokuwiki-plugin-godiag-2016-02-03.my/fetch.php	2022-07-02 17:55:18.799523952 +0300
@@ -6,7 +6,7 @@
  * @author     Andreas Gohr <andi@splitbrain.org>
  */
 
-if(!defined('DOKU_INC')) define('DOKU_INC',dirname(__FILE__).'/../../../');
+if(!defined('DOKU_INC')) define('DOKU_INC','/usr/share/webapps/dokuwiki');
 define('NOSESSION',true);
 define('DOKU_DISABLE_GZIP_OUTPUT', 1);
 require_once(DOKU_INC.'inc/init.php');
EOF
}

package() {
  install -d "${pkgdir}/var/lib/dokuwiki/plugins"
  cp -a "${srcdir}/dokuwiki-plugin-godiag-${pkgver//./-}" "${pkgdir}/var/lib/dokuwiki/plugins/godiag"
}
