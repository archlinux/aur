# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3wrap"
pkgname="${_pkgname}-bin"
pkgver=0.5
pkgrel=2
pkgdesc="Tool for wrapping mp3 files. A free independent alternative to AlbumWrap"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64le' 'riscv64'
      's390x')
url="https://mp3wrap.sourceforge.net"
license=('LGPL-2.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64le,riscv64,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_mips64el.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_ppc64el.deb")
source_riscv64=("${_pkgsrc}-riscv64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_riscv64.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-4+b1_s390x.deb")
sha256sums_x86_64=('339855818c6bcb40c212a5a0964c14cf90ec86346b128e55b0c04f564d23a2d1')
sha256sums_aarch64=('a6015b23df97936548e9083ba718982a459c948ec0f9dd861ee79392ea2d342d')
sha256sums_armel=('8aad4c1a940b4682c41963e6054ab0cc83c9cfa3be7368f09193952c2ae000c4')
sha256sums_armhf=('a906bbac5280d13a3703dd60ac53dc9985228aa5669e5583b441419eb3d8cb66')
sha256sums_i686=('64d21fcf2aa752a34dad05508dc9ae87bb2c031bfa4252e2fc08ba214cd5c3c5')
sha256sums_mips64le=('aeb9232d4f9433a2e24a772bd079ed00575389c17013e574fd0310232691ccd6')
sha256sums_ppc64le=('074aa331b1b681081e9bfc7c7c62cb30e12e4de664c85cba28e3a6bf0e74a27e')
sha256sums_riscv64=('c12db7002b9323b295a164a89f3b8504e84fa92d047cfc0a4cb9c9f871178734')
sha256sums_s390x=('5724bce60a228fd35329ae6b4bfa741690df4d1e8945d1fb599bb2a795ce1ded')

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

  cd "${pkgdir}/usr/share"
  rm -rf "doc-base"

  cd "doc/${_pkgname}"
  rm -f changelog.* "copyright"
}
