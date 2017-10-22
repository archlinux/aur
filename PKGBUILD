# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=safesignidentityclient
pkgver=3.0.101
pkgrel=4
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('i686' 'x86_64')
url="http://www.validcertificadora.com.br/SafeSignLinux"
license=('custom:copyright')
depends=('pcsclite' 'gdbm183' 'wxgtk2.8-light' 'openssl098' 'xdg-utils' 'libmspack')
optdepends=('ccid: generic USB Chip/Smart card interface devices driver',
            'acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_i686=("https://raw.githubusercontent.com/geyslan/morpho/master/SafeSignIC$pkgver-i386-deb6-admin.deb")
source_x86_64=("https://raw.githubusercontent.com/geyslan/morpho/master/SafeSignIC$pkgver-x86_64-deb6-admin.deb")
sha512sums_i686=('1b1aca9b19eb859a23dc6173c8bc035e76bcd74319c02c2b00099f16f1ac4f9e631f0f62f91bea60f5e2c2bd75541d17038eb57aa9a44e2ce70cb3bd381b5fc4')
sha512sums_x86_64=('b41e8e0b9bcb2ad4eb7e73b065951e46138105672f1885f97b584fdb94b565a1032cd118913a66208478b6a17e7549c43609e734841a7f05d50fee8b7ff74ef7')

prepare() {
  tar zxf data.tar.gz
}

build() {
  cd ${srcdir}
  local _filename
  if [[ arch == "i686" ]]; then
    _filename=${pkgver}-i386
  else
    _filename=${pkgver}-x86_64
  fi

  # Use deb2targz to extract the beefy parts of the files
  deb2targz SafeSignIC$_filename-deb6-admin.deb
  tar xvf SafeSignIC$_filename-deb6-admin.tar.gz
}

package() {
  cd ${pkgdir}

  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  ln -s "/usr/lib/libaetpkss.so.3.0" ${pkgdir}/usr/lib/libaetpkss.so
}
