pkgname=libdcmtk17-bin
_pkgname="${pkgname%-*}"
pkgver=3.6.7
pkgrel=1
_debrel=9
pkgdesc="OFFIS DICOM toolkit runtime libraries."
arch=('i686' 'x86_64')
url="https://dicom.offis.de/dcmtk"
_url="https://packages.ubuntu.com/noble/libdcmtk17" # LTS
provides=("${_pkgname}")
replaces=("${_pkgname}")
depends=(
  'libpng>=1.6.2'
  'libtiff>=4.0.3'
  'libwrap>=7.6'
  'libxml2>=2.7.4'
  'openssl>=3.0'
  'zlib>=1.1.4'
)
options=('!strip' '!emptydirs')

source_x86_64=("https://mirrors.kernel.org/ubuntu/pool/universe/d/dcmtk/${_pkgname}_${pkgver}-${_debrel}_amd64.deb")

package() {
  tar xf data.tar.zst -C "${pkgdir}"
  find "${pkgdir}/usr/lib/x86_64-linux-gnu/" -type f,l | xargs -I{} mv {} "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu/"

  install -D -m644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums_x86_64=('92ecfa3cd190b1305d3cca8f8316c9942f1a1dec00c84315e8cac87fe26afccd')
