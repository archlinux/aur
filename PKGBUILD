# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=wps-office-kr-bin
pkgver=12.1.2.29183
pkgrel=2
pkgdesc='WPS Office Korean-patched build (prebuilt binary from GitHub Releases)'
arch=('x86_64')
url='https://github.com/nahdd123uosackr/wps-office-kr'
license=('LicenseRef-WPS-EULA')
depends=('fontconfig' 'xorg-mkfontscale' 'libxrender' 'desktop-file-utils'
         'shared-mime-info' 'xdg-utils' 'glu' 'sdl2' 'libpulse'
         'hicolor-icon-theme' 'libxss' 'sqlite' 'libtool' 'libxslt' 'libjpeg-turbo')
optdepends=('cups: printing support'
            'pango: complex (right-to-left) text support'
            'ttf-wps-fonts: Symbol fonts required by WPS Office'
            'ttf-ms-fonts: Microsoft fonts recommended for WPS Office')
provides=('wps-office-kr' 'wps-office' 'wps-office-mime' 'wps-office-fonts')
conflicts=('wps-office-kr' 'wps-office' 'wps-office-365' 'wps-office-cn'
           'wps-office-mime' 'wps-office-fonts' 'kingsoft-office')
options=('!strip' '!debug' '!emptydirs')
install=wps-office-kr-bin.install

_gh="https://github.com/nahdd123uosackr/wps-office-kr/releases/download/v${pkgver}"
_pkgs=(
  "wps-office-kr-${pkgver}-1-x86_64.pkg.tar.zst"
  "wps-office-kr-mime-${pkgver}-1-any.pkg.tar.zst"
  "wps-office-kr-fonts-${pkgver}-1-any.pkg.tar.zst"
)

source=("${_pkgs[0]}::${_gh}/${_pkgs[0]}"
        "${_pkgs[1]}::${_gh}/${_pkgs[1]}"
        "${_pkgs[2]}::${_gh}/${_pkgs[2]}")
sha256sums=(
            '354a239a3a14a7afb40fd172bfeabd16785381865b1e56f540fcb9c5bd6e9960'
            'f2935c9ab05a92a24d8a0a5b798ac34a9e4c32b6582b29f533a46eb7563962e9'
            'ca0885c92c909e754aff37837af8f569ac2999360dc28227b5bc1349b14b9965')

package() {
  # 미리 빌드된 pacman 패키지들을 그대로 풀어 재패키징한다.
  # .PKGINFO/.BUILDINFO/.MTREE/.INSTALL 은 메타데이터이므로 제외.
  local p
  for p in "${_pkgs[@]}"; do
    bsdtar -xf "${srcdir}/${p}" -C "${pkgdir}" \
      --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.INSTALL'
  done
}
