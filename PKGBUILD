# Maintainer: gaou-piou <c.ballios@paperman.ai>
# Based on extension-bitwarden-git (David Hummel) and firefox-extension-bitwarden (Matt Harrison)

pkgbase=extension-bitwarden-dist
pkgname=('brave-extension-bitwarden-dist'
         'chrome-extension-bitwarden-dist'
         'chromium-extension-bitwarden-dist'
         'edge-extension-bitwarden-dist'
         'firefox-extension-bitwarden-dist'
         'librewolf-extension-bitwarden-dist'
         'opera-extension-bitwarden-dist')
pkgver=2026.10.2
pkgrel=1
pkgdesc='Bitwarden browser extensions (official release dist builds)'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
# bsdtar (libarchive) is part of base and unpacks the zips
_rel="${url}/releases/download/browser-v${pkgver}"
source=("dist-chrome-${pkgver}.zip::${_rel}/dist-chrome-${pkgver}.zip"
        "dist-edge-${pkgver}.zip::${_rel}/dist-edge-${pkgver}.zip"
        "dist-firefox-${pkgver}.zip::${_rel}/dist-firefox-${pkgver}.zip"
        "dist-opera-${pkgver}.zip::${_rel}/dist-opera-${pkgver}.zip"
        "LICENSE_GPL-${pkgver}.txt::https://raw.githubusercontent.com/bitwarden/clients/browser-v${pkgver}/LICENSE_GPL.txt")
noextract=("dist-chrome-${pkgver}.zip"
           "dist-edge-${pkgver}.zip"
           "dist-firefox-${pkgver}.zip"
           "dist-opera-${pkgver}.zip")
sha256sums=('2ebc61246a2ea82a65c589b8484e26a5678253fa6474c26dc5b6a7a7fcacbda4'
            'f688b7c9880323803a71b8db66cc68db463549c178a7da4446779411660d2102'
            '4f812658de3ef86385348aeeae81a24b072bc26171d5db8931217e6a3c4b94aa'
            'a0e549db7702086f101271e6c2d9e9f8a7367dc63241648ad02eadb8ece0b8bb'
            'b98fbb37db5b23bc5cfdcd16793206a5a7120a7b01f75374e5e0888376e4691c')

_firefox_id='{446900e4-71c2-419f-a6a7-df9c091e268b}'

# Unpacked Chromium-family extension: loaded manually via "Load unpacked".
_package_unpacked() {
  local _browser=$1
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar -xf "${srcdir}/dist-${_browser}-${pkgver}.zip" -C "${pkgdir}/usr/share/${pkgname}" --no-same-owner
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE_GPL-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_GPL.txt"
}

# Firefox-family: the zip is the xpi, auto-loaded from the system extensions directory.
_package_xpi() {
  local _dir=$1
  install -Dm644 "${srcdir}/dist-firefox-${pkgver}.zip" \
    "${pkgdir}/usr/lib/${_dir}/browser/extensions/${_firefox_id}.xpi"
  install -Dm644 "${srcdir}/LICENSE_GPL-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_GPL.txt"
}

package_brave-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Brave (official dist build)'
  optdepends=('brave: the browser this extension is for')
  provides=('brave-extension-bitwarden')
  conflicts=('brave-extension-bitwarden' 'brave-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_chrome-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Google Chrome (official dist build)'
  optdepends=('google-chrome: the browser this extension is for')
  provides=('chrome-extension-bitwarden')
  conflicts=('chrome-extension-bitwarden' 'chrome-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_chromium-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Chromium (official dist build)'
  optdepends=('chromium: the browser this extension is for')
  provides=('chromium-extension-bitwarden')
  conflicts=('chromium-extension-bitwarden' 'chromium-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_edge-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Microsoft Edge (official dist build)'
  optdepends=('microsoft-edge-stable-bin: the browser this extension is for')
  provides=('edge-extension-bitwarden')
  conflicts=('edge-extension-bitwarden' 'edge-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked edge
}

package_firefox-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Firefox (official dist build)'
  groups=('firefox-addons')
  optdepends=('firefox: the browser this extension is for')
  provides=('firefox-extension-bitwarden')
  conflicts=('firefox-extension-bitwarden' 'firefox-extension-bitwarden-git')
  _package_xpi firefox
}

package_librewolf-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for LibreWolf (official dist build)'
  optdepends=('librewolf: the browser this extension is for')
  provides=('librewolf-extension-bitwarden')
  conflicts=('librewolf-extension-bitwarden' 'librewolf-extension-bitwarden-git')
  _package_xpi librewolf
}

package_opera-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Opera (official dist build)'
  optdepends=('opera: the browser this extension is for')
  provides=('opera-extension-bitwarden')
  conflicts=('opera-extension-bitwarden' 'opera-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked opera
}
