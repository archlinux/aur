# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: gamestime102 < >

pkgname=quake3-rally
pkgver=0.7
pkgrel=1
pkgdesc="Open-source survival racing game on the ioquake3 engine."
arch=('x86_64')
url="https://github.com/Q3Rally-Team/q3rally.git"
license=('GPL2')
depends=('ioquake3' 'desktop-file-utils')
source=("https://github.com/Q3Rally-Team/q3rally/releases/download/v${pkgver}/Q3rally_v${pkgver}_linux64.zip"
        "q3rally"
        "q3rally.desktop")
sha256sums=('d6f688a202440a3e65c70727ab7bde4d6ca5a27f3048c4ed69af0f73860503f8'
            'ccb555feb894c45ee9445fefbd9dda1da9c340839047e9b11e624ed699696283'
            '8a68880e44f1ca45a6c3ac1838ca116d27edb6bec36f773aa5d9d1cef02c43bc')

check() {
  desktop-file-validate q3rally.desktop
}

package() {
  cd Q3rally_v0.7_linux64

  rm -f baseq3r/*.so

  mkdir -p "${pkgdir}/opt/quake3"
  cp -a baseq3r "${pkgdir}/opt/quake3"

  # Install client launcher
  cd "${srcdir}"
  install -D -m 0755 q3rally "${pkgdir}/usr/bin/q3rally"
  install -D -m 0644 q3rally.desktop "${pkgdir}/usr/share/applications/q3rally.desktop"
}

