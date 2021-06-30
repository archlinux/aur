# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=syrinscape-boardgame-player
pkgver=1.4.11_p9
pkgrel=1
pkgdesc="Soundscape creator and sound design app for boardgame games"
arch=('x86_64')
url="https://www.syrinscape.com"
license=('Proprietary')
groups=()
depends=()
options=(!strip)
source=("syrinscape-${pkgver//_/-}-linux-boardgame.tar.gz::https://www.syrinscape.com/get-download/syrinscape-${pkgver//_/-}-linux-scifi.tar.gz?type=linux&version=${pkgver//_/-}"
        "local://syrinscape-boardgame-player.desktop"
        )
sha256sums=('68bd3d1ff0575d7da306c81ad448f823f575cfc700b892185a3fccd4ab903102'  ## syrinscape-${pkgver//_/-}-linux-boardgame.tar.gz
            'SKIP'  ## syrinscape-boardgame-player.desktop
          ) 

# Look away, this is gross
download_func() {
  /usr/bin/curl "https://syrinscape.com/get-download/syrinscape-${pkgver//_/-}-linux-boardgame.tar.gz?type=linux&version=${pkgver//_/-}" 2>&1 | /usr/bin/grep -P "\tlocation.href" | /usr/bin/cut -d "'" -f 2 | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-boardgame.tar.gz
}
export -f download_func; export pkgver; DLAGENTS=('https::/bin/bash -c download_func %o %u')

prepare() {
  mkdir -p "${srcdir}/usr/share/applications"
  cp "syrinscape-boardgame-player.desktop" "${srcdir}/usr/share/applications/syrinscape-boardgame-player.desktop"
  sed -i "s/VERSIONNUM/${pkgver//_/-}/g" "${srcdir}/usr/share/applications/syrinscape-boardgame-player.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "Syrinscape Board Game Player" "${pkgdir}/opt/Syrinscape Board Game Player"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/syrinscape-boardgame-player.desktop" "${pkgdir}/usr/share/applications/syrinscape-boardgame-player.desktop"
}

