# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=winusb
pkgver=1.0.11
pkgrel=1
pkgdesc='Simple tool to create a usb stick installer for Windows (Vista and above)'
arch=('i686' 'x86_64')
url="http://en.congelli.eu/prog_info_winusb.html"
license=('GPL3')
depends=('wxgtk' 'grub' 'ntfs-3g' 'gksu' 'parted')
source=("http://www6.frugalware.org/mirrors/linux/frugalware/frugalware-current/source/xapps-extra/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'findFile.patch')
md5sums=('08a5de928f510d383b7bca0a31adb2d6'
         '1a7636163e49ca53d93ebe477d60c776')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/findFile.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
