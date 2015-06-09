# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Gris Ge <cnfourt@gmail.com>

# Based on Fedora's python-kerberos fedpkg master branch
# (commit: 527d74f8c74ab41ada333c379d29630adc2ece40)

pkgname=python2-kerberos
pkgver=1.1
pkgrel=3
pkgdesc="A high-level wrapper for Kerberos (GSSAPI) operations"
arch=(i686 x86_64)
url="http://trac.calendarserver.org/browser/PyKerberos"
license=(Apache)
depends=(python2 krb5)
makedepends=(python2-distribute svn)
source=("svn+http://svn.calendarserver.org/repository/calendarserver/PyKerberos/tags/release/PyKerberos-${pkgver}/"
        PyKerberos-delegation.patch
        PyKerberos-version.patch
        PyKerberos-inquire.patch
        PyKerberos-gsswrap.patch)
sha512sums=('SKIP'
            '3eafe36f4f5fdd99c3511e3fa3fdc83bec25d5e0d302ec8968b23136beb5a1a6bd69f56af84cbdc151485a59c300c654830390030de5237c189e1df3265653b7'
            'e23bf71ecd6464d2187cbe7964e7b627feb14c1536c88d30ba05a1b4fc0ca6efc204c3ded677f7bc28313c330644f5def2b466b72f14f74a1f0d7f4cee1a6829'
            '4ca33eac32331988551f9fd79246b162b2f62165a8062e6c68d1de510a24e31bd8ae592e3b8c7d548a570174024f42279ae13d4e79a27312b6dd8c9d48be8fe0'
            '3e1a7dc00dde33b0ed6a6a61f026bae0be813d89e571b1a9c382ffc2c91c7e2cac0b2df27e72da35972fe679f721c68905a0fef5d5e1b3fac012fff4ff633958')

prepare() {
  rm -rf PyKerberos-${pkgver}-build/
  cp -r PyKerberos-${pkgver}{,-build}/
  cd PyKerberos-${pkgver}-build/

  patch -p1 -i ../PyKerberos-delegation.patch
  patch -p1 -i ../PyKerberos-version.patch
  patch -p1 -i ../PyKerberos-inquire.patch
  patch -p1 -i ../PyKerberos-gsswrap.patch
}

build() {
  cd PyKerberos-${pkgver}-build/
  python2 setup.py build
}

package() {
  cd PyKerberos-${pkgver}-build/
  python2 setup.py install --skip-build --root "${pkgdir}"
}
