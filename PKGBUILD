# Maintainer: Gustavo Martins <gustarmartins at users dot noreply dot github dot com>

pkgname=jukebox
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal music player with local FLAC and Jellyfin streaming support'
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
b2sums=(
  'a9110c837b3ec6059f355b8af49c73516970f313a893c344edc61b50b24f798ed7fdda33ebab89665d7d52d244606974f46e9a729fba4f42087665df0fc1f4e0'
  '99f2a576eeff2454ad61c2d0a037ed6a49c78d6c902bed270c79f5fb0fdb0f7e93dcd2a2148d2ca6410718b5c63bc456684ecddd0100693ac8a0d4bf8d21d33d'
  '9b5617920181139b3aa6762ea9e8de5cf3e7b65b5d0b949c68cf2dc6c40724959861bcbe8af4060cfa884c38de578c74c9ec7b4bd8026d0009736c9a99c9a008'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/jukebox" "${pkgdir}/usr/bin/jukebox"
  install -Dm755 "${srcdir}/nightcore" "${pkgdir}/usr/bin/nightcore"
  install -Dm755 jukebox/jukebox.zsh "${pkgdir}/usr/share/${pkgname}/jukebox.zsh"
  install -Dm755 jukebox/_fzf_preview.py "${pkgdir}/usr/share/${pkgname}/_fzf_preview.py"
  install -Dm755 jukebox/jellyfin_client.py "${pkgdir}/usr/share/${pkgname}/jellyfin_client.py"
  install -d "${pkgdir}/usr/share/${pkgname}/src"
  install -m644 jukebox/src/*.zsh "${pkgdir}/usr/share/${pkgname}/src/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
