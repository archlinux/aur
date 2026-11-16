# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Sajid Ahamed <crxssrazr93@gmail.com>

pkgname=voquill
pkgver=0.0.656
pkgrel=1
pkgdesc="AI voice dictation with local Whisper transcription"
arch=('x86_64')
url="https://github.com/josiahsrc/voquill"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'gtk3'
  'gtk-layer-shell'
  'libayatana-appindicator'
  'libpulse'
  'vulkan-icd-loader'
  'webkit2gtk-4.1'
  'wtype'
  'xdotool'
)
provides=('voquill-gpu')
conflicts=('voquill-gpu')
options=('!debug')
_debname=voquill-desktop
source=("${_debname}_${pkgver}_amd64.deb::https://github.com/josiahsrc/voquill/releases/download/desktop-v${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('bb2e915b944081725d5740e262965823e1071f5863f3bb75e82f71c17290d443')

latestver() {
  gh api --paginate repos/josiahsrc/voquill/tags --jq '.[].name' |
    sed -nE 's/^desktop-v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
  bsdtar -O -xf "${srcdir}/${_debname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xzf -
}
