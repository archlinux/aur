# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='linux-user-chroot'
pkgver='2015.1'
pkgrel='5'
pkgdesc='setuid helper for making bind mounts and chrooting'
url='http://git.gnome.org/browse/linux-user-chroot/tree/README'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libseccomp')
source=("https://git.gnome.org/browse/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0eb351a261a851765e50acdb50d09f49be1c2e14ecd7055a9578dd318b71aa3c38627394151e782c8ff143bf3787e78d54753e9d1de78b134bcbd5a57999fd8c')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  chmod +s "${pkgdir}/usr/bin"/linux-user-chroot
  for doc in README NEWS ; do
    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
  done
}

