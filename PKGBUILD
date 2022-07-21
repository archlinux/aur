# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=syrinscape-fantasy-player
pkgver=1.4.13_p0
pkgrel=1
pkgdesc="Soundscape creator and sound design app for fantasy games"
arch=('x86_64')
url="https://www.syrinscape.com"
license=('Proprietary')
groups=()
depends=()
options=(!strip)
source=("syrinscape-${pkgver//_/-}-linux-fantasy.tar.gz::https://www.syrinscape.com/get-download/syrinscape-${pkgver//_/-}-linux-scifi.tar.gz?type=linux&version=${pkgver//_/-}"
        "local://syrinscape-fantasy-player.desktop"
        )
sha256sums=('0f46ac897a7f145217e93076c54f006d8b9e5502812003084d7f53c4d9f8c4e8'  ## syrinscape-${pkgver//_/-}-linux-fantasy.tar.gz
            'SKIP'  ## syrinscape-fantasy-player.desktop
          ) 

# Look away, this is gross
download_func() {
  /usr/bin/curl "https://syrinscape.com/get-download/syrinscape-${pkgver//_/-}-linux-fantasy.tar.gz?type=linux&version=${pkgver//_/-}" 2>&1 | /usr/bin/grep -P "\tlocation.href" | /usr/bin/cut -d "'" -f 2 | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-fantasy.tar.gz
}
export -f download_func; export pkgver; DLAGENTS=('https::/bin/bash -c download_func %o %u')

prepare() {
  mkdir -p "${srcdir}/usr/share/applications"
  cp "syrinscape-fantasy-player.desktop" "${srcdir}/usr/share/applications/syrinscape-fantasy-player.desktop"
  sed -i "s/VERSIONNUM/${pkgver//_/-}/g" "${srcdir}/usr/share/applications/syrinscape-fantasy-player.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "Syrinscape" "${pkgdir}/opt/Syrinscape Fantasy Player"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/syrinscape-fantasy-player.desktop" "${pkgdir}/usr/share/applications/syrinscape-fantasy-player.desktop"
}

