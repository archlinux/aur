# Maintainer: Dessyume <dess@dessyu.me>

_pkgname=nerimity
pkgname=nerimity-bin
pkgver=2.2.0
pkgrel=3
pkgdesc="A modern and sleek chat app."
arch=('x86_64')
url="https://github.com/Nerimity/nerimity-desktop"
license=('custom:unknown')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')

_appimage="Nerimity-${pkgver}.AppImage"

source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "nerimity.ico::https://nerimity.com/favicon.ico"
)

sha256sums=('SKIP' 'SKIP')

prepare() {
  chmod +x "${srcdir}/${_appimage}"
  "${srcdir}/${_appimage}" --appimage-extract
}

build() {
  :
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/nerimity/nerimity.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/nerimity" <<'EOF'
#!/bin/sh
exec /opt/nerimity/nerimity.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/nerimity.desktop" <<'EOF'
[Desktop Entry]
Name=Nerimity
Comment=A modern and sleek chat app.
Exec=nerimity %U
Icon=nerimity
Terminal=false
Type=Application
Categories=Network;Chat;
StartupNotify=true
EOF

  install -Dm644 "${srcdir}/nerimity.ico" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nerimity.ico"
}
