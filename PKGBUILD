# Maintainer: NoverPlay Team
pkgname=noverplay-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='NoverPlay desktop music player'
arch=('x86_64')
url='https://noverplay.space'
license=('custom:proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme' 'alsa-plugins' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('yt-dlp: optional media extraction helper')
provides=('noverplay')
conflicts=('noverplay')
options=('!strip')
source_x86_64=('noverplay-bin-1.1.2-x86_64.deb::https://noverplay.space/download/linux/Noverplay_1.1.2_amd64.deb'
               'LICENSE.noverplay')
sha256sums_x86_64=('e64a0c56bb90633362d47d4e306c0f739c4489410387c4f56e3a4ea30845aaa3'
                   'af5569229702fc7b41c7cb9269e176cec8c96779d7cbad52ff7dfb2657d52075')

package() {
  bsdtar -xf "${srcdir}/noverplay-bin-1.1.2-x86_64.deb" -C "${srcdir}"

  local data_tar
  data_tar="$(find "${srcdir}" -maxdepth 1 -name 'data.tar.*' -print -quit)"
  if [[ -z "${data_tar}" ]]; then
    echo "data.tar.* was not found inside the deb artifact" >&2
    return 1
  fi

  bsdtar -xf "${data_tar}" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE.noverplay" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
