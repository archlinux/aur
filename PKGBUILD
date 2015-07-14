# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='linux-user-chroot'
pkgver='2013.1'
pkgrel='4'
pkgdesc='setuid helper for making bind mounts and chrooting'
url='http://git.gnome.org/browse/linux-user-chroot/tree/README'
arch=('i686' 'x86_64')
license='GPL'
depends=('glibc')
source=("https://git.gnome.org/browse/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha1sums=('4d158e691732ad6e6be95203146c448bd64e90a0')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-newnet-helper
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  chmod +s "${pkgdir}/usr/bin"/linux-user-chroot{,-newnet}
  for doc in README README.newnet ; do
    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
  done
}

