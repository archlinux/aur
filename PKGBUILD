# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="azimuth"
pkgname="${_pkgname}-bin"
pkgver=1.0.3
pkgrel=1
pkgdesc="A metroidvania with vector graphics"
arch=('x86_64' 'aarch64' 'i686')
url="https://mdsteele.games/azimuth"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,i686}".rpm")
source_x86_64=("${_pkgsrc}-x86_64.rpm::https://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/x86_64/${_pkgsrc}-1.201.x86_64.rpm")
source_aarch64=("${_pkgsrc}-aarch64.rpm::https://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/aarch64/${_pkgsrc}-1.291.aarch64.rpm")
source_i686=("${_pkgsrc}-i686.rpm::https://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/i586/${_pkgsrc}-1.201.i586.rpm")
b2sums_x86_64=('66297caf0f4b27072c3893450b8e13e1766579eda7a72bfb95555cc44adfa78568158384b7a538d590bf6be45a7788b052700bf7854d39f4e2acb49666a302fd')
b2sums_aarch64=('f72413a6369bcf6b0f223ba2fabe17afb0aa804911a5fbc6bf44e2e5c63cb5aaf7915fd778dcb25d535fee5fd6d3c1501ea40ab0b2c7eba246d5ac9fe1d77a6b')
b2sums_i686=('531b6258eff6549423dfee0b96e684e48a41126b382955f577a0c08d132e4bfd383b123b89dd23781ce0aa7c215a8941027ff991b5bd91c1b252c3c9420bb712')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.rpm" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/usr/share"
  mkdir -p "licenses/${_pkgname}"
  mv -f "doc/${_pkgname}/LICENSE" "licenses/${_pkgname}/LICENSE"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
}
