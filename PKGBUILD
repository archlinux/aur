# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx[at]gmail[dot]com>

pkgname=adom-noteye
epoch=1
pkgver=2.3.8
pkgrel=3
pkgdesc="A roguelike game with a quest-centric, plot driven structure (+ GUI)"
arch=("x86_64")
url="http://www.adom.de/"
conflicts=('adom' 'adom-restricted' 'adom-noteye')
provides=('adom')
depends=('ncurses' 'mesa' 'sdl_image' 'sdl_net' 'sdl_mixer' 'lua51'
         'libbsd')
_source_url="https://repo.sshadm.in/archlinux/eldios/${arch}"

license=('custom: "adom"')
source_x86_64=(${_source_url}/adom_noteye_64_2.3.8.tar.gz)

# PACKAGES
sha256sums_x86_64=('bfed98d97c429beddd1707cdf3913c30b2c4a363943de0c1bc7a31885b533301')

package() {
  # Copy entire contents of the archive to /opt
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/adom" "${pkgdir}/opt/"
  # Since the adom binary uses a relative RPATH, it's either
  # this or patching the binary
  install -d "${pkgdir}/usr/bin"
  cat>"${pkgdir}/usr/bin/adom"<<EOF 
#!/bin/sh
cd /opt/adom && ./adom
EOF
  chmod 755 "${pkgdir}/usr/bin/adom"
}
