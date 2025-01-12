# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyserial-git
pkgver=1.4.r2.g3c6cda7
pkgrel=2
epoch=
pkgdesc="A GUI Serial Debug Tool for Linux/Mac OS."
arch=($CARCH)
url="https://github.com/carloscn/tinyserial"
license=('MPL-2.0')
groups=()
depends=(
  gcc-libs
  glibc
  qt5-base
  qt5-serialport
)
makedepends=(
  git
  qt5-tools
)
checkdepends=()
optdepends=()
provides=(tinyserial)
conflicts=(tinyserial)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  qmake
  make
}

package() {
  install -Dm0755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm0755 "${srcdir}/${pkgname%-git}/img/appmain-ubuntu.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.carloscn.tinyserial.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.carloscn.tinyserial</id>

  <name>${pkgname%-git}</name>
  <summary>${pkgname%-git}</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-3.0-only</project_license>

  <description>
    <p>
      ${pkgdesc}
    </p>
  </description>

  <launchable type="desktop-id">io.github.carloscn.tinyserial.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.carloscn.tinyserial.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname%-git}
Comment=${pkgname%-git}
Categories=Network;Qt;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
