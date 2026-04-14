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
sha256sums=('9710ded1c40e040f6d06608a25e13c1c847852c1416630a7efff1badb0be257b'
            '7ead77f8a3bc699efcb746a98d5414250e080c27a656b16dd883a9484cb79f8a'
            'f8b1d85e3dc3e0a07cf5991141e5a8f327dd6f5fa173cfa3ce911298daa90db9')

check() {
  desktop-file-validate q3rally.desktop
}

package() {
  cd q3rally_v0.7c_patch_linux64

  rm -f baseq3r/*.so

  mkdir -p "${pkgdir}/opt/quake3"
  cp -a baseq3r "${pkgdir}/opt/quake3"

  # Install client launcher
  cd "${srcdir}"
  install -D -m 0755 q3rally "${pkgdir}/usr/bin/q3rally"
  install -D -m 0644 q3rally.desktop "${pkgdir}/usr/share/applications/q3rally.desktop"
}

# vim:set ts=2 sw=2 et:
