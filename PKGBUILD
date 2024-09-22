# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mcrypt"
pkgname="${_pkgname}-bin"
pkgver=2.6.8
pkgrel=1
pkgdesc="A replacement for the old unix crypt(1)"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      'riscv64' 's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('bash' 'glibc' 'libmcrypt' 'mhash' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,riscv64,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_ppc64el.deb")
source_riscv64=("${_pkgsrc}-riscv64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_riscv64.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-8_s390x.deb")
b2sums_x86_64=('2ac2b2aac01e9ce8191b11d8cc3b11bfc0f17190bd0dd34f5239d26ba647053c85c86f867b33469ef8ebc7aad2e587ae65945460ed48e7287d5e0abd89d6b5d5')
b2sums_aarch64=('2f009e2f6f2ccfcaba9b04190e096a73259f4a685ebb63b44e1f259a2e45f6da1e65627fa448ab913717fdeaa65a3fb1100215611dc08e60921cd2a0813fc7ee')
b2sums_armel=('79cad24afbb1c76c3e4668620156c5073d01ed5ec72f467a8a39f81c5ce7783f6066cf97a16bc4e2de786a958a383117db367b89206389dab93a37c69cae4304')
b2sums_armhf=('1c78d69a55a0be07521a36f69284af58bacc342edfb9a726c9c8af0723e83258d6e8b1623f993badcbff02487919c4176629f962bfa926cff2c8ffdb681149c5')
b2sums_i686=('da1f37c9b797e193e29306ebb7751d8b085d112df3fb68f1e23c027c455c6c81ce6b4477b61cff04c77d4cce25d6cdd0169c306807ed7f30b29a3c8b68ea0d7a')
b2sums_mips64le=('f979520da5e2decce3d316995de94c092c93d59da254ca71a283272e28b5797fb0a9adb2631b6066b93db4ad220c1c7635f10364187b765c491d62873689ac3d')
b2sums_ppc64=('73795e63e79f44c59133b27c708c912826c2c45cec12003cc91d125329477a99f8f4e466764405f9b8ff290bf7f191246d2a27bcb9bdd6fca6fb0d892f2cd904')
b2sums_ppc64le=('a5ba141b534b2debb45858df6628520690e3c1b953f2fa3773fcd16e95846644dee08b6403c0f4e41dd55e93a57d04d1b26329ef772c0f675b5aa23365cb1a29')
b2sums_riscv64=('d89ffde109ba8113f129db5b1699d8ecbbfbb4dd663b284ebab144ec7a44a850388170b31516e79b4715c481e822cec2f46b86100dc0da12f06994634b27b082')
b2sums_s390x=('e824901152ffe5628ebe6a1bb3fb6514478a83d5285582812ef12578c912757bbd5e90f49904dcb0f5473d9f7beed7bd0a9b07e9ab0f1581df8468a8e7cd6ae5')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright *.Debian*
}

package() {
  cd "${srcdir}"
  cp -r "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  cd "${pkgdir}/usr"
  find "bin"   -type f -exec chmod 755 {} +
  find "share" -type f -exec chmod 644 {} +
}
