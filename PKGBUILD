# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>
pkgname=ttf-blex-nerd-font-git
pkgver=v3.0.1.r96.g7039b47
pkgrel=1
pkgdesc="IBM Plex Mono Font patched with ryanoasis' Nerd Fonts glyphs."
arch=(any)
url="https://github.com/ryanoasis/nerd-fonts"
license=('custom:OFL1.1')
optdepends=('fontconfig')
conflicts=('nerd-fonts-git' 'ttf-ibmplex-mono-nerd' 'nerd-fonts-ibm-plex-mono')
provides=('ttf-ibmplex-mono-nerd' 'ttf-font-nerd')
groups=('nerd-fonts')
raw_url="$url/raw/master/patched-fonts/IBMPlexMono/Mono"

source=(
  "${raw_url}/BlexMonoNerdFont-Bold.ttf"
  "${raw_url}/BlexMonoNerdFont-BoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-ExtraLight.ttf"
  "${raw_url}/BlexMonoNerdFont-ExtraLightItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-Italic.ttf"
  "${raw_url}/BlexMonoNerdFont-Light.ttf"
  "${raw_url}/BlexMonoNerdFont-LightItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-Medium.ttf"
  "${raw_url}/BlexMonoNerdFont-MediumItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-Regular.ttf"
  "${raw_url}/BlexMonoNerdFont-SemiBold.ttf"
  "${raw_url}/BlexMonoNerdFont-SemiBoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-Text.ttf"
  "${raw_url}/BlexMonoNerdFont-TextItalic.ttf"
  "${raw_url}/BlexMonoNerdFont-Thin.ttf"
  "${raw_url}/BlexMonoNerdFont-ThinItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Bold.ttf"
  "${raw_url}/BlexMonoNerdFontMono-BoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-ExtraLight.ttf"
  "${raw_url}/BlexMonoNerdFontMono-ExtraLightItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Italic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Light.ttf"
  "${raw_url}/BlexMonoNerdFontMono-LightItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Medium.ttf"
  "${raw_url}/BlexMonoNerdFontMono-MediumItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Regular.ttf"
  "${raw_url}/BlexMonoNerdFontMono-SemiBold.ttf"
  "${raw_url}/BlexMonoNerdFontMono-SemiBoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Text.ttf"
  "${raw_url}/BlexMonoNerdFontMono-TextItalic.ttf"
  "${raw_url}/BlexMonoNerdFontMono-Thin.ttf"
  "${raw_url}/BlexMonoNerdFontMono-ThinItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Bold.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-BoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-ExtraLight.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-ExtraLightItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Italic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Light.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-LightItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Medium.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-MediumItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Regular.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-SemiBold.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-SemiBoldItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Text.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-TextItalic.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-Thin.ttf"
  "${raw_url}/BlexMonoNerdFontPropo-ThinItalic.ttf"
  "LICENSE::${raw_url}/LICENSE.txt"
)

sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 
  )

prepare(){
  # we don't need to download gigabytes of blobs to get the versioning @_@
  git clone --sparse --filter=blob:none https://github.com/ryanoasis/nerd-fonts.git nerd-fonts-sparse
  cd nerd-fonts-sparse
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  ) > ../pkgver
  rm -rf ${srcdir}/nerd-fonts-sparse
}

pkgver() {
  cat ${srcdir}/pkgver
}

package() {
  install -Dm 644 -t "${pkgdir}/usr/share/fonts/TTF" ${srcdir}/*.ttf
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
