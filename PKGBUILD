# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Archeb <archebasic@hotmail.com>

pkgname=opentrace-bin
pkgver=1.4.4.0
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'webkit2gtk')
makedepends=('curl' 'jq')
provides=('opentrace')
conflicts=('opentrace')
source=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-x64.tar.gz"
        "opentrace.desktop::https://raw.githubusercontent.com/Archeb/opentrace/master/opentrace.desktop"
        "logo.png::https://raw.githubusercontent.com/nxtrace/Ntrace-core/main/asset/logo.png")
sha256sums=('200e23de0bee6603944818e8e48448825a394769f17d3c1f01f63495b5164653'
            '69f8c4799f6db03bf17cd78b1de7a18d939ec5e282190942172dbe13e39c2075'
            '93cf17802f2691d63e29a7020afb0c7c39782c85212ce4b795cc8486f36c758d')

pkgver() {
  # Fetch latest version from GitHub API
  curl -s "https://api.github.com/repos/Archeb/opentrace/releases/latest" | jq -r '.tag_name' | sed 's/^v//'
}

package() {
  # Create target directory
  install -dm755 "${pkgdir}/opt/${pkgname}"
  
  # Copy files
  cp -r "${srcdir}"/* "${pkgdir}/opt/${pkgname}"
  
  # Create binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/OpenTrace" "${pkgdir}/usr/bin/opentrace"
  
  # Install desktop file and icon
  install -Dm644 "opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
  install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/opentrace.png"
}
