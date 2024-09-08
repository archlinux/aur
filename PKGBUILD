# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cccc"
pkgname="${_pkgname}-bin"
pkgver=3.2.0
pkgrel=1
pkgdesc="A code counter providing code metrics for C, C++, Ada, and Java projects"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_ppc64el.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}+dfsg1-1_s390x.deb")
sha256sums_x86_64=('e3dee864f833aa18090d1fac61b0bc6023597fe65b121b5751e8f25b255de595')
sha256sums_aarch64=('3442fced9f7857a3eb3eab79e11081bc510bda600195868dae588cbc771c33d0')
sha256sums_armel=('92b0b8b1aa46d4e090edbecc7a6f987d7175435b0b9415b4a032d286fd400732')
sha256sums_armhf=('2d43de772f1da606dc817702ea17883b8c75de5573277c7f2870903b035fa749')
sha256sums_i686=('20bdb74edec854a50a5224daa45121d065b3aa93350edde8432800c16f53c825')
sha256sums_mips64le=('afe5c46eff044b6c255dce76e8fa6ac941177e052f85a04bb0adee8a9baec0ce')
sha256sums_ppc64=('8ecdccebf49a0a9225623c3cdd463864bfba03c4c6279604746e92a0b7ad554a')
sha256sums_ppc64le=('6876ac3a7c05d2b4a722a1536caa59bb32b64dc000510ab79b61ed8224b0cdcf')
sha256sums_s390x=('9c5f6631be05c0c8e0a157c757a97f7309459eda66730fad65c6c5e966734bed')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  rm -f changelog.* ChangeLog.* copyright INSTALL NEWS.*
}
