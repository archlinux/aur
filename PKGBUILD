# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=ldapjdk
_gitname=ldap-sdk
pkgver=4.21.0
pkgrel=1
pkgdesc="The Mozilla LDAP Java SDK"
arch=(any)
url="http://www.mozilla.org/directory/javasdk.html"
license=(Mozilla GPL LGPL)
depends=(java-runtime jss)
makedepends=(apache-ant java-environment)
source=("https://github.com/dogtagpki/${_gitname}/archive/v${pkgver}.tar.gz")
sha512sums=('c1a01c179d5f2f7635327124439089b68c387e9f93038072feff719624f913fa0efbfa6bad71f9229bc3314e732b020e007cc60d942fed06a2a6bf1ea40d5f7b')

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
