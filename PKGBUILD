# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Developer: MitSoft <signa-support@mitsoft.lt>
pkgname=signa-browser-ext
r=10900
d=2022-03-16
pkgver=1.1.r${r}.${d//-}
pkgrel=1
pkgdesc="Native helper for web login using Lithuanian identity cards (for SoDra, VMI, &c)"
url="https://www.mitsoft.lt/kontaktai/"
arch=(any)
license=('custom')
depends=('pcsclite>=1.5' 'jre11-openjdk')
source=("https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_r${r}_${d}_Linux.zip")
sha256sums=('d98e0be97bf9268650b0c0ab22ddd1db1fff7e31e855720a09a796a3cf6e839d')

# Update check:
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_Linux.zip
# Other platforms:
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_lt.msi
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_en.msi
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt.pkg

prepare() {
  rm -rf */
  bsdtar xf "signa-browser-ext-$pkgver-1-any.pkg.tar.xz"
}

build() {
  jre_dir="/usr/lib/jvm/java-11-openjdk"
  sed -i "s|^java=.*|java='$jre_dir/bin/java'|" opt/signa-browser-ext/java
}

package() {
  cp -av usr/ opt/ "$pkgdir"/
}

# vim: ts=2:sw=2:et
