# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt"
pkgname="${_pkgname}-bin"
pkgver=2.6.2
pkgrel=2
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_ppc64el.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+20170630-3.2+b1_s390x.deb")
sha256sums_x86_64=('1389e85058912014a6bada04e0d0f7b8077f6b08598df6bd26b94461e48f775b')
sha256sums_aarch64=('5716804a7a7391babaf1728ff5a30d017e43b5aaa824e3be8a2586fd3e4f5987')
sha256sums_armel=('f424c8fc498054b435cebfb459589df784e81cb2a253d7e6c92755afb0125648')
sha256sums_armhf=('3d844de0900f8cacdbaaa532d113c7f6aa90c070616281cdba0b1bc0651aba5e')
sha256sums_i686=('a0794e8c1fccf7fa340f8efd636c62409ed811631a52c8e72329e5309d1462d9')
sha256sums_mips64le=('6ce42e1d2146f139987228104874f04b05ce55e9f539267dd06e92483ff76bef')
sha256sums_ppc64=('19eb069accd65b46c3e5f024dc86c4a8a24c9a22c90401f406faab43c1ed37f4')
sha256sums_ppc64le=('e1d9c09991ed6a90980711c6adbb0f15835ca15b3fa7c59add6b2956a48b9738')
sha256sums_s390x=('c090034b25151239ae93cc1e44da94c3e207170c7e1f6aa359d67828339b9d62')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  cp -r "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  rm -f changelog.* ChangeLog.* copyright INSTALL NEWS.*

  cd "${pkgdir}/usr"
  find "bin"   -type f -exec chmod 755 {} +
  find "share" -type f -exec chmod 644 {} +
}
