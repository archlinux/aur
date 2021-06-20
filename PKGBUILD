# maintainer: libele <libele@disroot.org>

# contributor: Odel <odelvidyascape@gmail.com>
# contributor: Alessandro Schillaci < http://slade.altervista.org >

pkgname=inform
pkgver=6.35.r1
_ifrel="6.35-r1"
pkgrel=1
pkgdesc="Interactive fiction compiler"
arch=(i686 x86_64)
url="http://www.inform-fiction.org/"
license=('Artistic2.0' 'MIT')
depends=('glibc')
groups=(inform)
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/${pkgname}-${_ifrel}.tar.gz")

md5sums=('5264603402833081d9a74f899efa7279')

build(){
  cd "${srcdir}"/"${pkgname}-${_ifrel}"
  make PREFIX=/usr MAN_PREFIX=/usr/share
}

package() {
  cd "${srcdir}"/"${pkgname}-${_ifrel}"
  make PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install

  rm "${pkgdir}"/usr/bin/punyinform*
  sed 's,^LIBPATH.*,LIBPATH=/usr/share/inform,g' "${srcdir}"/"${pkgname}-${_ifrel}"/punyinform.sh > "${pkgdir}"/usr/bin/punyinform
  chmod +x "${pkgdir}"/usr/bin/punyinform
}
