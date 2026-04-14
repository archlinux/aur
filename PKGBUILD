# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: gamestime102 < >

pkgname=quake3-rally
pkgver=0.7c
pkgrel=1
epoch=1
pkgdesc="Open-source survival racing game on the ioquake3 engine."
arch=('any')
url="https://github.com/Q3Rally-Team/q3rally/"
license=('GPL2')
depends=('ioquake3' 'desktop-file-utils')
source=("https://github.com/Q3Rally-Team/q3rally/releases/download/v${pkgver}/q3rally_v${pkgver}_patch_linux64.zip"
        "q3rally"
        "q3rally.desktop")
sha256sums=('9710ded1c40e040f6d06608a25e13c1c847852c1416630a7efff1badb0be257b')

check() {
  desktop-file-validate q3rally.desktop
}

package() {
  cd Q3Rally

  rm -f baseq3r/*.so

  mkdir -p "${pkgdir}/opt/quake3"
  cp -a baseq3r "${pkgdir}/opt/quake3"

  # Install client launcher
  cd "${srcdir}"
  install -D -m 0755 q3rally "${pkgdir}/usr/bin/q3rally"
  install -D -m 0644 q3rally.desktop "${pkgdir}/usr/share/applications/q3rally.desktop"
}

# vim:set ts=2 sw=2 et:
