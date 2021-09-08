# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Developer: MitSoft <signa-support@mitsoft.lt>
pkgname=signa-browser-ext
r=10372
d=2021-06-24
pkgver=1.1.r${r}.${d//-}
pkgrel=1
pkgdesc="Native helper for web login using Lithuanian identity cards (for SoDra, VMI, &c)"
url="https://www.mitsoft.lt/kontaktai/"
arch=(any)
license=('custom')
depends=('pcsclite>=1.5' 'jre11-openjdk')
source=("https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_r${r}_${d}_Linux.zip")
sha256sums=('a41dd4ba5042f29290419efa4844a50bfda701f8c2cf4fa1f58b18998bbee374')

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
