# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt-gtk"
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=3
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('x86_64' 'aarch64' 'armel' 'armhf' 'i686' 'mips64le' 'ppc64' 'ppc64le'
      's390x')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1.0'
         'gtk3>=3.4.2' 'libaudclient>=3.0' "libmp3splt=${pkgver}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armel,armhf,i686,mips64le,ppc64,ppc64le,s390x}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_arm64.deb")
source_armel=("${_pkgsrc}-armel.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_armel.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_i386.deb")
source_mips64le=("${_pkgsrc}-mips64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_mips64el.deb")
source_ppc64=("${_pkgsrc}-ppc64.deb::http://ftp.ports.debian.org/debian-ports/pool-ppc64/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_ppc64.deb")
source_ppc64le=("${_pkgsrc}-ppc64le.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_ppc64el.deb")
source_s390x=("${_pkgsrc}-s390x.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname%%-gtk}/${_pkgname}_${pkgver}-3.2+b1_s390x.deb")
sha256sums_x86_64=('6dcd6a426a81b4e592fbc9537c644bab2b24752eadc955d25f4455fa66d5b1d1')
sha256sums_aarch64=('981fb096e2cbbcadffd3c7e40a744db30d48fe6e386b19bb65ac1a35d9fbbc94')
sha256sums_armel=('8e75abb8f920d9c8ce6b0d0a55e0d2f8bd5643fc89995ccab8aa42dda2088c7c')
sha256sums_armhf=('207f8c206a63a3e598c39fbe0aa2f6b5c29b85ae3b0910c52a958769b891afc1')
sha256sums_i686=('2c43b7591fa677ee587588c6dc06ec960e25bfe62938562726b8155117e7552c')
sha256sums_mips64le=('a084311cfae359a5a6fe1580a9c7eaea29abf356816f071756db822b0f59db23')
sha256sums_ppc64=('1953fd6e0250b9498a2cb99784b7ffb9bdc87d40a7580b5753bbdd16ac9c5f64')
sha256sums_ppc64le=('edf42fb81b98a4bd19aab97a24fdbee3bfac655421e04463e401186ee1b6b341')
sha256sums_s390x=('63da321683ffafa431e7ed69cbbfc7089816d95ee9eb6514d45c6dcf39adbfae')

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
