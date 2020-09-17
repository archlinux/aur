# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=syrinscape-online-player
pkgver=1.4.8_p2
pkgrel=2
pkgdesc="Soundscape creator and sound design app for online games"
arch=('x86_64')
url="https://www.syrinscape.com"
license=('Proprietary')
groups=()
makedepends=('recode')
depends=()
options=(!strip)
source=("syrinscape-${pkgver//_/-}-linux-online.tar.gz::https://www.syrinscape.com/online/"
        "local://syrinscape-online-player.desktop"
        )
sha256sums=('c3d3bdad18de36060e536fae88b2cc2aa6474c3c9f2478f51d7b8a1dc4d674e8'  ## syrinscape-${pkgver//_/-}-linux-online.tar.gz
            'SKIP'  ## syrinscape-online-player.desktop
          ) 

# Look away, this is gross
download_func() {
  /usr/bin/curl "https://www.syrinscape.com/online/" 2>&1 | /usr/bin/grep "tar.gz" | /usr/bin/cut -d '"' -f 2 | /usr/bin/recode html..ascii | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-online.tar.gz
}
export -f download_func; export pkgver; DLAGENTS=('https::/bin/bash -c download_func %o %u')

prepare() {
  mkdir -p "${srcdir}/usr/share/applications"
  cp "syrinscape-online-player.desktop" "${srcdir}/usr/share/applications/syrinscape-online-player.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "Syrinscape Online Player" "${pkgdir}/opt/Syrinscape Online Player"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/syrinscape-online-player.desktop" "${pkgdir}/usr/share/applications/syrinscape-online-player.desktop"
}

