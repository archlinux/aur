# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Sajid Ahamed <crxssrazr93@gmail.com>

pkgname=voquill
pkgver=0.0.641
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
sha256sums=('265cf7f4eca04917a3dc0bdcf4d231418a3e5b603f1f1f42b97092ceb9557957')

latestver() {
  gh api --paginate repos/josiahsrc/voquill/tags --jq '.[].name' |
    sed -nE 's/^desktop-v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
  bsdtar -O -xf "${srcdir}/${_debname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xzf -
}
