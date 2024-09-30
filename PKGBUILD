# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="rakarrack"
pkgname="${_pkgname}-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="Versatile guitar multi-effects processor"
arch=('x86_64' 'aarch64' 'i686' 'ppc64le' 's390x')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-only')
depends=('alsa-lib' 'fftw' 'fltk' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'jack' 'libsamplerate' 'libsndfile' 'libx11' 'libxpm')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,i686,ppc64le,s390x}".rpm")
source_x86_64=("${_pkgsrc}-x86_64.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.29.20150814gita620840.fc41/x86_64/${_pkgsrc}-0.29.20150814gita620840.fc41.x86_64.rpm")
source_aarch64=("${_pkgsrc}-aarch64.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.29.20150814gita620840.fc41/aarch64/${_pkgsrc}-0.29.20150814gita620840.fc41.aarch64.rpm")
source_i686=("${_pkgsrc}-i686.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.29.20150814gita620840.fc41/i686/${_pkgsrc}-0.29.20150814gita620840.fc41.i686.rpm")
source_ppc64le=("${_pkgsrc}-ppc64le.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.29.20150814gita620840.fc41/ppc64le/${_pkgsrc}-0.29.20150814gita620840.fc41.ppc64le.rpm")
source_s390x=("${_pkgsrc}-s390x.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.29.20150814gita620840.fc41/s390x/${_pkgsrc}-0.29.20150814gita620840.fc41.s390x.rpm")
b2sums_x86_64=('0c6d2322d15497f550a1b011b2a480d085be1b3d424ffca3f187c1eeaf2b6c3fa3ecf90d4c2880eba95ab568b0c261092b52ea02e88df07bba35356a0050948f')
b2sums_aarch64=('31124bbed2247d0894a8a41a2ac5b38c2196435f29415af5cf4132a2e961888688e531b9a4c10a208268c59a130e76d862fe04e60cee1e899366807523d92f48')
b2sums_i686=('e7cf1b950efd2819323a4b6df955b5983b54e0f4657b86e3c3c78a7ace5b633bcd4df081670877674099d308129a30de2a5f3c93097be1caeb80842e0dc4d3dd')
b2sums_ppc64le=('9c9d92d450e90b7ce5a5e8b0fc0a5496280c42997756205578e2c2e84d99139c6a333b36908a6b80d3e8b4b19d219093c2bbdeb58b0fb03cf6c269cc58985f4d')
b2sums_s390x=('b773d002f616e48d85ba06f16a1a977a456240af6c2baa43361f9e0de4b77e01b6e4e7cbcb2cc6562a4bf540a44a22f670dbdf2d82f5f500f16133cb9289e3f1')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.rpm" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/usr"
  rm -rf "lib"

  cd "share"
  mkdir -p "licenses/${_pkgname}"
  mv -f "doc/${_pkgname}/COPYING" "licenses/${_pkgname}/COPYING"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
}
