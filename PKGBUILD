# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com.
# Contributor: Meow King <mr.ziqiyang@gmail.com>

_pkgname="flying-carpet"
pkgname="${_pkgname}-bin"
pkgver=8.0.1
pkgrel=2
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=('x86_64' 'aarch64')
url="https://github.com/spieglt/FlyingCarpet"
license=('GPL-3.0-only')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libsoup' 'webkit2gtk')
provides=("${_pkgname}") 
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64}".deb")
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/linux_${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::${url}/releases/download/v${pkgver}/linux_${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('cb2d5d765235991404afe438c8ed4184a5f798eca2e03836696b40a1539e67c0'
            '68fc3b3e41307c4fb2f0174896f9549240e84b60865064f8dd70dffa65f7b5b1')
sha256sums_x86_64=('5f4318dbdba14f561b180d4f0bcf0821b9c7cae4b8e10691eb9133833d7473c8')
sha256sums_aarch64=('a6b58d8359bf18ac999c78eeab280f00d40cbcf146a22deb0a91949ea2d20c5b')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}/usr"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  
  cd "${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"
}
