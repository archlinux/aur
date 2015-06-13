# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Changaco <changaco@changaco.net>

pkgname=mbrola
pkgver=3.0.1h
pkgrel=5
pkgdesc="A phoneme-to-audio converter used by many TTS (Text-to-speech) programs"
arch=('i686' 'x86_64')
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
license=('custom:Mbrola')
depends_i686=('glibc')
depends_x86_64=('lib32-glibc')
source=("http://tcts.fpms.ac.be/synthesis/${pkgname}/bin/pclinux/mbr${pkgver//./}.zip")
sha256sums=('df402fad97c823206fce68837c1d716b9c0466a4cfb554dfb244df7da5589d6e')

build() {
  # Prepare license file
  sed -n '/This program and object/,/2.0 A brief description of MBROLA/p' readme.txt | head -n -1 > "LICENSE"
}

package() {
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "mbrola-linux-i386" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  # Install documentation file
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "readme.txt"
}

