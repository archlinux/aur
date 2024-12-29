# Maintainer: taotieren <admin@taotieren.com>

pkgname=coilgunrailgunutility-mono
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="一个计算电磁炮的软件 Coilgun Railgun Misaka Mikoto 你指尖跳动的电光,是我永恒不变的信仰。"
arch=('any')
url="https://github.com/kmakise/CoilgunRailgunUtility"
license=('MIT')
groups=()
depends=('mono')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('CoilgunRailgunUtility')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-mono}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname%-mono}"
  xbuild RailgunCalcWin.sln
}

package() {
  cd "${srcdir}/${pkgname%-mono}/bin/Debug/"
  install -Dm0755 RailgunCalcWin.exe "${pkgdir}/opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe"
  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-mono}" <<EOF
#!/bin/bash
mono /opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe "\$@"
EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.kmakise.coilgunrailgunutility.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=CoilgunRailgunUtility
Comment=CoilgunRailgunUtility
Categories=Education;Electricity;

Icon=coilgunrailgunutility
Exec=coilgunrailgunutility
Terminal=false

EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.kmakise.coilgunrailgunutility.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.kmakise.coilgunrailgunutility</id>

  <name>CoilgunRailgunUtility</name>
  <summary>CoilgunRailgunUtility</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>MIT</project_license>

  <description>
    <p>
      一个计算电磁炮的软件 Coilgun Railgun Misaka Mikoto 你指尖跳动的电光,是我永恒不变的信仰。
    </p>
  </description>

  <launchable type="desktop-id">io.github.kmakise.coilgunrailgunutility.desktop</launchable>
</component>
EOF
}
