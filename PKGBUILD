# Maintainer: JWalk9000 <you@example.com>
pkgname=hyprsnipper
pkgver=1.0.4
pkgrel=1
pkgdesc="A friendly snipping tool for Hyprland/Wayland (Qt/PySide6)"
arch=('x86_64' 'aarch64')
url="https://github.com/JWalk9000/hyprsnipper"
license=('GPL3')
depends=('python' 'pyside6' 'python-yaml' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
optdepends=('swappy: quick annotation editor' 'gimp: image editor' 'krita: image editor')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/hyprsnipper"
  # Install application files
  cp -r src config resources "${pkgdir}/usr/share/hyprsnipper/"
  # Wrapper
  install -d "${pkgdir}/usr/bin"
  printf '#!/bin/sh\ncd /usr/share/hyprsnipper/src\nexec python main.py "$@"\n' > "${pkgdir}/usr/bin/hyprsnipper"
  chmod 755 "${pkgdir}/usr/bin/hyprsnipper"
  # Desktop entry
  install -D -m644 resources/desktop/hyprsnipper.desktop "${pkgdir}/usr/share/applications/hyprsnipper.desktop"
  # Licenses and docs
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
