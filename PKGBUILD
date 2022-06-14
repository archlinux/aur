# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=0.0.1.2
pkgrel=1
epoch=1
pkgdesc="A car driving and car combat game based on the Quake III Arena engine"
arch=('any')
url="https://sourceforge.net/projects/q3rallysa/"
license=('GPL2')
depends=('ioquake3' 'desktop-file-utils')
source=("https://downloads.sourceforge.net/project/q3rallysa/Q3Rally%20v${pkgver}/q3rally_v${pkgver//./}_linux64.zip"
        "q3rally"
        "q3rally.desktop")
sha256sums=('0055d3cd1a7d849fe948833d245262ee8c33da5d350c45cddb3bbbb1478fd28b'
            'ca5268f09d285eed22000312a065871fab43a02fe3ae82f60d0706002552c611'
            'f8b1d85e3dc3e0a07cf5991141e5a8f327dd6f5fa173cfa3ce911298daa90db9')

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
