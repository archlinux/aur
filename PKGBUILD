# Maintainer:  dreieck

_pkgname="firefox-developer-edition-firefox-symlink"
pkgname="${_pkgname}-latest"
pkgver=91.0b7
pkgrel=1
pkgdesc="Adds a 'firefox'-symlink for 'firefox-developer-edition'. Also symlinks icon- and .desktop-files."
arch=("any")
license=(
  'MPL'
  'GPL'
  'LGPL'
) # The licenses of 'firefox-developer-edition'.
depends=(
  "firefox-developer-edition"
)
provides=(
  "${_pkgname}=${pkgver}"
  "firefox=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "firefox"
)

pkgver() {
  # firefox-developer-edition --version | awk '{print $3}'
  pacman -Qi firefox-developer-edition | grep -E '^Version[[:space:]]*:' | awk -F ':' '{print $2}' | tr -d '[[:space:]]' | sed -E 's|\-[^-]*$||'
}

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s -v -T "firefox-developer-edition" "firefox"

  install -d -v -m755 "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  ln -s -v -T "firefox-developer-edition.desktop" "firefox.desktop"

  for _icons_png_hicolor in 16x16 32x32 48x48 64x64 128x128 192x192 384x384; do
    install -d -v -m755 "${pkgdir}/usr/share/icons/hicolor/${_icons_png_hicolor}/apps"
    cd "${pkgdir}/usr/share/icons/hicolor/${_icons_png_hicolor}/apps"
    ln -s -v -T "firefox-developer-edition.png" "firefox.png"
  done

  install -d -v -m755 "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  cd "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
  ln -s -v -T "firefox-developer-edition-symbolic.svg" "firefox-symbolic.svg"
}
