# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cccc"
pkgname="${_pkgname}-bin"
pkgver=3.2.0+dfsg1_2
pkgrel=1
pkgdesc="A code counter providing code metrics for C, C++, Ada, and Java projects"
arch=('x86_64' 'aarch64' 'i686' 'armv5h' 'powerpc64' 'powerpc64le' 's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('gzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,i686,armv5h,powerpc64,powerpc64le,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_arm64.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_i386.deb")
source_armv5h=("${_pkgsrc}-armv5h.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_armhf.deb")
source_powerpc64=("${_pkgsrc}-powerpc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_ppc64.deb")
source_powerpc64le=("${_pkgsrc}-powerpc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_ppc64el.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver//_/-}_s390x.deb")
sha256sums_x86_64=('934601fe9d84479f03bcb8b723e930a4ee638d82d354941a45878575b70bfdd0')
sha256sums_aarch64=('6d90dc9da9756b6a117d5a651097b0a1457380d8cb5f6036b89b786d8d32f518')
sha256sums_i686=('f909c82dacc0503968f5906aa3d583e2bbd289ba2020d4074ab13bd487bde4ec')
sha256sums_armv5h=('f36c0e8052e4b8f543c81967437a9cd575f5ae07247a49d1bb02ba6afd5c9a8f')
sha256sums_powerpc64=('8b8a6a82ccfc66d315f5a8c01dad31be50efbd40de615439e711123e2a0d2284')
sha256sums_powerpc64le=('38995861dae79ead7df7297523443cc3e14cb14d0f75ec2135c5e2ac4e4593be')
sha256sums_s390x=('c2bebc73b08f811ab52a05ee3f8c3979eb1ca1d3c5fa96fbae332055bbb24473')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f *Debian* copyright INSTALL
  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"
}
