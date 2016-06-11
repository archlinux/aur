# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=0.0.0.4
pkgrel=1
epoch=1
pkgdesc="A car driving and car combat game based on the Quake III Arena engine"
arch=('any')
url="https://sourceforge.net/projects/q3rallysa/"
license=('GPL2')
depends=('ioquake3' 'desktop-file-utils')
makedepends=('unrar')
_srcname="q3rally_v${pkgver//./}_linux_x86"
source=("https://downloads.sourceforge.net/project/q3rallysa/Pre-Alpha%20Releases/${_srcname}.rar"
        "q3rally"
        "q3rally.desktop")
noextract=("${_srcname}.rar")
sha256sums=('e31976b42778d92db26d5d6aa59cd95411bbb908ad53c5a13f5a3472f6f875ad'
            '69e7049d7fd0967ce5a04c5c8177d56c14bc81f733f6d20f3113cd2f3959e7f0'
            'f8b1d85e3dc3e0a07cf5991141e5a8f327dd6f5fa173cfa3ce911298daa90db9')

prepare() {
  unrar x -o+ "${_srcname}.rar"
}

package() {
  pushd "${_srcname}"

  # Remove unneeded files
  rm baseq3r/*.so

  # Copy mod files
  mkdir -p "${pkgdir}/opt/quake3"
  cp -dR baseq3r "${pkgdir}/opt/quake3"

  popd

  # Install client launcher
  install -D -m 0755 q3rally "${pkgdir}/usr/bin/q3rally"
  install -D -m 0644 q3rally.desktop "${pkgdir}/usr/share/applications/q3rally.desktop"
}

# vim:set ts=2 sw=2 et:
