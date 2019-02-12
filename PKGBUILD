# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=ldapjdk
_gitname=ldap-sdk
pkgver=4.20.0
pkgrel=1
pkgdesc="The Mozilla LDAP Java SDK"
arch=(any)
url="http://www.mozilla.org/directory/javasdk.html"
license=(Mozilla GPL LGPL)
depends=(java-runtime jss)
makedepends=(apache-ant java-environment)
source=("https://github.com/dogtagpki/${_gitname}/archive/v${pkgver}.tar.gz")
sha512sums=('f04530a314e91f7be6f5fbcb847a5a2554ca3e8131dc8cd8888f4ace01e7da86fa044b78299b937c49723f82f0c55cf81c3f4f249c11932f9a70cb0a7e9e9f84')

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
