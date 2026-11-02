# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=wps-office-kr-bin
pkgver=12.1.2.29183
pkgrel=1
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
            '8d2ca44ef74a8ad4aeadc30dd708fc8cae0f0ade9499d64cecd178e7b5e7476c'
            '32a81fc1117182ea359106e24749a6ef1abe523582d1e97c9d75bd73a05f2edd'
            'fccc753aee5d4b4139fb00fde69d7f0e6613506af07c9db1f680799dfe7cd7da')

package() {
  # 미리 빌드된 pacman 패키지들을 그대로 풀어 재패키징한다.
  # .PKGINFO/.BUILDINFO/.MTREE/.INSTALL 은 메타데이터이므로 제외.
  local p
  for p in "${_pkgs[@]}"; do
    bsdtar -xf "${srcdir}/${p}" -C "${pkgdir}" \
      --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.INSTALL'
  done
}
