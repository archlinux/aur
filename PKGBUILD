# Maintainer: Gustavo Martins <gustarmartins at users dot noreply dot github dot com>

pkgname=jukebox
pkgver=0.1.6
pkgrel=1
pkgdesc='Terminal music player with local FLAC/MP3 and Jellyfin streaming support'
arch=('any')
url='https://github.com/gustarmartins/jukebox'
license=('MIT')
depends=('zsh' 'mpv' 'fzf' 'ffmpeg' 'chafa' 'python')
optdepends=(
  'sox: create Nightcore remixes'
  'inotify-tools: refresh the local library automatically'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'jukebox'
  'nightcore'
)
b2sums=('bf48bcdda4bbbd13eff3e6dd34bc9fac5c2c71ec59e30d64cf3984a2828d070925b1144f7f53806fa205decea7b659d0a643766e3d16fdad57a7e935d752a37a'
        '99f2a576eeff2454ad61c2d0a037ed6a49c78d6c902bed270c79f5fb0fdb0f7e93dcd2a2148d2ca6410718b5c63bc456684ecddd0100693ac8a0d4bf8d21d33d'
        '9b5617920181139b3aa6762ea9e8de5cf3e7b65b5d0b949c68cf2dc6c40724959861bcbe8af4060cfa884c38de578c74c9ec7b4bd8026d0009736c9a99c9a008')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/jukebox" "${pkgdir}/usr/bin/jukebox"
  install -Dm755 "${srcdir}/nightcore" "${pkgdir}/usr/bin/nightcore"
  install -Dm755 jukebox/jukebox.zsh "${pkgdir}/usr/share/${pkgname}/jukebox.zsh"
  install -Dm755 jukebox/_fzf_preview.py "${pkgdir}/usr/share/${pkgname}/_fzf_preview.py"
  install -Dm755 jukebox/jellyfin_client.py "${pkgdir}/usr/share/${pkgname}/jellyfin_client.py"
  install -d "${pkgdir}/usr/share/${pkgname}/src"
  install -m644 jukebox/src/*.zsh jukebox/src/*.py "${pkgdir}/usr/share/${pkgname}/src/"
  install -Dm644 jukebox/assets/NO-COVER.png "${pkgdir}/usr/share/${pkgname}/assets/NO-COVER.png"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
