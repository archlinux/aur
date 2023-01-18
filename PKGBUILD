# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=wtwitch
pkgver=2.6.0
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://github.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("curl" "jq" "streamlink")
makedepends=("scdoc")
optdepends=('fzf: for browsing and watching streams with fzf'
            'mpv: for watching streams'
            'vlc: for watching streams'
            'youtube-dl: for watching VODs'
            'yt-dlp: for watching VODs')

# Download information
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
sha256sums=("c3f3e81059ddb2c642ade6cdd940a911f02c39812c0bbaa343c3d0200be82965"
            "60f41237a120c8d599bdf1c051881a2a259944253d7d72d86ac3ce9743a24024")
validpgpkeys=("0C6B73F391FA26F0EBCD1F75C0F9AEE56E47D174")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # Create man page
  scdoc < wtwitch.1.scd > wtwitch.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # Bash completion file
  install -D -m644 wtwitch-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  
  # ZSH completion file
  install -D -m644 _wtwitch "${pkgdir}/usr/share/zsh/site-functions/_wtwitch"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}
