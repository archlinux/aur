# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Developer: MitSoft <signa-support@mitsoft.lt>
pkgname=signa-browser-ext
r=9261
d=2019-10-17
pkgver=1.0.r${r}.${d//-}
pkgrel=1
pkgdesc="Native helper for web login using Lithuanian identity cards (for SoDra, VMI, &c)"
url="https://www.mitsoft.lt/kontaktai/"
arch=(any)
license=('custom')
depends=('pcsclite>=1.5' 'jre8-openjdk')
source=("https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_r${r}_${d}_Linux.zip")
sha256sums=('b721122079c5ab04e66103a2e5ff3da31383342e5aca30391c852f77a8ee1291')

# Update check:
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_Linux.zip
# Other platforms:
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_lt.msi
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_en.msi
# curl -I https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt.pkg

prepare() {
  rm -rf */
  #bsdtar xf "signa-browser-ext-1.0-r${r}-${d//-}-noarch.rpm"
  bsdtar xf "signa-browser-ext-1.0.r${r}.${d//-}-1-any.pkg.tar.xz"
}

build() {
  jre_dir="/usr/lib/jvm/java-8-openjdk/jre"
  sed -i "s|^java=.*|java='$jre_dir/bin/java'|" opt/signa-browser-ext/java
}

package() {
  cp -av usr/ opt/ "$pkgdir"/
}

# vim: ts=2:sw=2:et
