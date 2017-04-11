# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=ldapjdk
pkgver=4.19
pkgrel=1
pkgdesc="The Mozilla LDAP Java SDK"
arch=(any)
url="http://www.mozilla.org/directory/javasdk.html"
license=(Mozilla GPL LGPL)
depends=(java-runtime jss)
makedepends=(apache-ant java-environment)
# Fedora kindly hosts a tarball of a cvs snapshot
source=("http://pkgs.fedoraproject.org/repo/pkgs/ldapjdk/ldapjdk-4.19.tar.gz/sha512/2a63827572423eab513a831b49ebe2fd0c93259f82f953576bf30050a51b5d2effcf167826c0ce213ef1bc4e8230ac56fd004987b4adb5a38cbb09598d0fccf8/ldapjdk-4.19.tar.gz")
sha512sums=('2a63827572423eab513a831b49ebe2fd0c93259f82f953576bf30050a51b5d2effcf167826c0ce213ef1bc4e8230ac56fd004987b4adb5a38cbb09598d0fccf8')

build() {
  cd "${pkgname}-${pkgver}"

  find . -type f -name '*.jar' -delete

  # cleanup CVS dirs
  rm -fr $(find . -name CVS -type d)
  # Link to build-system BRs
  ln -s /usr/lib/java/jss4.jar ./java-sdk/ldapjdk/lib/
  cd java-sdk

  ant dist
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 java-sdk/dist/packages/{ldapjdk,ldapsp,ldapfilt,ldapbeans}.jar \
    "${pkgdir}/usr/share/java/"
}
