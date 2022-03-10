# maintainer: libele <libele@disroot.org>
# maintainer: Beej <beej@beej.us>

# contributor: Alessandro Schillaci < http://slade.altervista.org >

pkgname=inform
pkgver=6.36.r1
_ifrel="6.36-r1"
pkgrel=1
pkgdesc="Interactive fiction compiler"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="http://www.inform-fiction.org/"
license=('Artistic2.0' 'MIT')
depends=('glibc')
groups=(inform)
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/${pkgname}-${_ifrel}.tar.gz")

md5sums=('229e50848a64c0317cdb59a2682484b7')

build() {
  cd "${srcdir}/${pkgname}-${_ifrel}"
  make PREFIX=/usr MAN_PREFIX=/usr/share
}

package() {
  cd "${srcdir}/${pkgname}-${_ifrel}"
  make REAL_PREFIX=/usr PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install

  cd "${pkgdir}"/usr/bin
  rm pblorb punyinform scanblorb
  mv punyinform.sh punyinform
}
