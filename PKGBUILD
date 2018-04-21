# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Developer: MitSoft <signa-support@mitsoft.lt>
pkgname=signa-browser-ext
r=7771
d=2017-08-12
pkgver=1.0.r${r}.${d//-}
pkgrel=1
pkgdesc="Native helper for web login using Lithuanian identity cards (for SoDra, VMI, &c)"
url="http://www.mitsoft.lt"
arch=(any)
license=('custom')
depends=('pcsclite>=1.5' 'jre8-openjdk')
source=("https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_r${r}_${d}_Linux.zip")
sha256sums=('d7ff7d8bee3cdf4d630ed746ee4a5be03d63acf236f1612e52a4e129e7570153')

prepare() {
  rm -rf */
  #bsdtar xf "signa-browser-ext-1.0-r${r}-${d//-}-noarch.rpm"
  bsdtar xf "signa-browser-ext-1.0.r${r}.${d//-}-1-any.pkg.tar.xz"

  # Apparently they now provide an Arch package as of r7771, which is cool.
  # However, (as far as my inbox knows), they haven't expressed interest in
  # maintaining this package in AUR.

  # Also I think I'm technically violating the license by having this on AUR,
  # but oh well
}

build() {
  jre_dir="/usr/lib/jvm/java-8-openjdk/jre"
  sed -i "s|^java=.*|java='$jre_dir/bin/java'|" opt/signa-browser-ext/java
}

package() {
  cp -av usr/ opt/ "$pkgdir"/
}

# vim: ts=2:sw=2:et
