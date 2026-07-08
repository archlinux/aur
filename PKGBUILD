# Maintainer: Alexis <rossfelderalexis@gmail.com>
pkgname=muse-sounds-manager
pkgver=2.2.1.953
pkgrel=1
pkgdesc="MuseSounds Manager - download and manage MuseSounds sample libraries"
arch=('x86_64')
url="https://www.musehub.com"
license=('custom')
depends=('glibc' 'fontconfig' 'gcc-libs' 'icu' 'libx11' 'libice' 'libsm')
options=('!strip')
source=("https://muse-cdn.com/Muse_Sounds_Manager_x64.tar.gz")
sha256sums=('cbb7ca1e1da91bcb93e29d2fab6d2bb16f1b480a7599ea64776b16ff4e8ddc42')

package() {
  local srcname="Muse_Sounds_Manager_x64_${pkgver}"
  local instdir="${pkgdir}/opt/${pkgname}"

  install -dm755 "${instdir}"
  cp -a "${srcdir}/${srcname}/bin" "${instdir}/bin"
  find "${instdir}/bin" -type d -exec chmod 755 {} \;

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec "/opt/${pkgname}/bin/muse-sounds-manager" "\$@"
EOF

  install -Dm644 "${srcdir}/${srcname}/res/muse-sounds-manager.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for size in 48 64 128 256; do
    install -Dm644 "${srcdir}/${srcname}/res/icons/hicolor/${size}x${size}/apps/muse-sounds-manager.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/muse-sounds-manager.png"
  done

  install -Dm644 "${srcdir}/${srcname}/README.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
