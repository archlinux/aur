# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pccts"
pkgname="${_pkgname}-bin"
pkgver=1.33MR33
pkgrel=1
pkgdesc="Purdue Compiler-Compiler Tool Set"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      'riscv64' 's390x')
url="http://www.polhode.com/pccts.html"
license=('custom:Public Domain')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,riscv64,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_ppc64el.deb")
source_riscv64=("${_pkgsrc}-riscv64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_riscv64.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-6.4_s390x.deb")
sha256sums_x86_64=('2380f0edab8d9e3aa3dc821ca5379c5ec29587ed00247915bb89f6a305f3a180')
sha256sums_aarch64=('4f15702b197618958b807fb74c760ab06017789f2bd702f11e268c9e3140d433')
sha256sums_armel=('1afd7369d689602ff40fd21d1c1f009d4e4ae8bcd7ba6f99edd2dda571554dcd')
sha256sums_armhf=('c156b4d95b45e257db1c56cd536347c1c16d1b3645c6a7dd053a7279d32dd06a')
sha256sums_i686=('27d1f5d58737c5a9e8187e26a1edba5e51a34818bf626a1e8f59413e45be701c')
sha256sums_mips64le=('70df1ae616b9f509bc482bbd6095f09708d90e9d6f0bd2375dfd140cad1ae263')
sha256sums_ppc64=('75f12816c917e66880a602c5fec8cbb741583ccf9877efc88f69e935c1d8723a')
sha256sums_ppc64le=('8d5448bf8b46ad0bb584ad5cfed8a2b6884b585f67d2a3043c83e8bbd3084a34')
sha256sums_riscv64=('958ecbca34f936c71947a2f2aeb149947d6f891cfd19abcf28ed3b9ec9db5e38')
sha256sums_s390x=('7b31493017945a7a57dea2cb051f61ae8dc7407dcaa558955c0c4ece1ce3f33b')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"     -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/include" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
  find "usr/share"   -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  rm -f changelog.* ChangeLog.* copyright INSTALL NEWS.* *.Debian*
}
