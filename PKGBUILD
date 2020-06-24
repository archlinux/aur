# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=ldapjdk
_gitname=ldap-sdk
pkgver=4.22.0
pkgrel=1
pkgdesc="The Mozilla LDAP Java SDK"
arch=(any)
url="http://www.mozilla.org/directory/javasdk.html"
license=(Mozilla GPL LGPL)
depends=(java-runtime jss)
makedepends=(apache-ant java-environment)
source=("https://github.com/dogtagpki/${_gitname}/archive/v${pkgver}.tar.gz")
sha512sums=('5f8d2a2c0042f281e054cfd3dc1604a5038a77b175268b415cd708031940064b62ec41043bc49d25fdd860aaaaa2a2de95a0c92c409951bfac21770c2d4ff1be')

build() {
  cd "${_gitname}-${pkgver}"

  find . -type f -name '*.jar' -delete

  # Link to build-system BRs
  ln -s /usr/share/java/jss4.jar ./java-sdk/ldapjdk/lib/
  cd java-sdk

  ant dist
}

package() {
  cd "${_gitname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 java-sdk/dist/packages/{ldapjdk,ldapsp,ldapfilt,ldapbeans}.jar \
    "${pkgdir}/usr/share/java/"
}
