# Maintainer: kevku <kevku@gmx.com>
pkgname='xml-security-c-ria'
pkgver='1.7.3'
pkgrel='1'
pkgdesc='Old version of xml-security-c for digidoc'
arch=('i686' 'x86_64')
url='https://www.id.ee/'
license=('Apache')
depends=('xalan-c')
provides=("${pkgname%-ria}=1.7.3")
conflicts=("${pkgname%-ria}")
source=("https://installer.id.ee/media/ubuntu/pool/main/x/xml-security-c/xml-security-c_1.7.3.orig.tar.gz"
        "https://installer.id.ee/media/ubuntu/pool/main/x/xml-security-c/xml-security-c_1.7.3-4build1RIA1.debian.tar.xz")
sha256sums=('e5226e7319d44f6fd9147a13fb853f5c711b9e75bf60ec273a0ef8a190592583'
            '885287896f2a79562070041ea0bbedca3abd61c41806cdf1a3f50a73b3df24c9')

prepare() {
  cd "${srcdir}/${pkgname%-ria}-${pkgver}"
  series=(
             'Add-xsec-prefix-to-utilities.patch'
             'Avoid-forward-incompatibility-warnings-from-Automake.patch'
             'Fix-GCC6-FTBFS.patch'
             'Fix-GCC5-warnings.patch'
             'Fix-indentation-1.patch'
             'Remove-unused-variable-1.patch'
             'loadX509PEM-fix-potential-reading-past-unterminated-.patch'
             'Remove-superfluous-extern-keyword.patch'
             'TXFMOutputFile-close-output-file-only-if-it-s-open.patch'
             'Use-the-z-length-modifier-for-printing-size_t.patch'
             'Remove-unused-dereferences.patch'
             'Don-t-compute-unused-variables.patch'
             'Fix-indentation-2.patch'
             'Fix-indentation-3.patch'
             'Remove-unused-variable-2.patch'
             'Fix-indentation-4.patch'
             'Remove-unused-variable-3.patch'
             'Fix-indentation-5.patch'
             'Avoid-GCC-warning-suggesting-parentheses.patch'
             'Fix-typo-occured-occurred.patch'
             'Use-pkg-config-for-Xerces-OpenSSL-and-NSS-and-provid.patch'
             'We-do-not-use-pthreads-threadtest.cpp-is-Windows-onl.patch'
             'Only-add-found-packages-to-the-pkg-config-dependenci.patch'
             'xml-security-c-1.7.3_openssl1.1.patch'
        )
  for p in "${series[@]}"
  do
    patch -p1 -i "${srcdir}/debian/patches/$p"
  done
}


build() {
  cd "${srcdir}/${pkgname%-ria}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr \
    --without-nss \
    --with-openssl=/usr \
    --with-xalan=/usr \
    --disable-debug \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname%-ria}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
