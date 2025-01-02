# Maintainer: taotieren <admin@taotieren.com>

pkgbase=teachingapp-mcu-exunit-mono
pkgname=($pkgbase teachingapp-mcu-exunit-led-display-mono teachingapp-mcu-exunit-keyboard-mono)
pkgver=20200403.051824
pkgrel=1
arch=($CARCH)
url='https://github.com/kmakise/TeachingApp_MCU_Exunit'
license=('MIT')
provides=()
conflicts=()
depends=('mono')
makedepends=('git')

source=("${pkgbase%-mono}::git+${url}.git")

sha256sums=('SKIP')

noextract=()

build() {
  cd "${srcdir}/${pkgbase%-mono}/LEDDisplay"
  xbuild LEDDisplay.sln

  cd "${srcdir}/${pkgbase%-mono}/keyboard/CSharp源码"
  xbuild MySerialPort.sln
}
package_teachingapp-mcu-exunit-mono() {
  pkgdesc="TeachingApp MCU Exunit: 教学演示程序、单片机外设原理演示操作。"
  depends=(teachingapp-mcu-exunit-led-display-mono teachingapp-mcu-exunit-keyboard-mono)
}

package_teachingapp-mcu-exunit-led-display-mono() {
  pkgdesc="TeachingApp MCU Exunit: 数码管演示程序。"

  install -Dm0755 "${srcdir}/${pkgbase%-mono}/LEDDisplay/LEDDisplay/bin/Debug/LEDDisplay.exe" "${pkgdir}/opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe"
  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-mono}" <<EOF
#!/bin/bash
mono /opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe "\$@"
EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.kmakise.display.led.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname%-mono}
Comment=${pkgname%-mono}
Categories=Education;Electricity;

Icon=${pkgname%-mono}
Exec=${pkgname%-mono}
Terminal=false

EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.kmakise.display.led.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.kmakise.display.led</id>

  <name>LED-Display</name>
  <summary>LED-Display</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>MIT</project_license>

  <description>
    <p>
      TeachingApp MCU Exunit: 数码管演示程序。
    </p>
  </description>

  <launchable type="desktop-id">io.github.kmakise.display.led.desktop</launchable>
</component>
EOF
}

package_teachingapp-mcu-exunit-keyboard-mono() {
  pkgdesc="TeachingApp MCU Exunit: 键盘演示程序。（mono 下不支持 Linux 的串口功能。只能使用键盘）。"

  install -Dm0755 "${srcdir}/${pkgbase%-mono}/keyboard/CSharp源码/MySerialPort/bin/Debug/MySerialPort.exe" "${pkgdir}/opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe"
  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-mono}" <<EOF
#!/bin/bash
sudo mono /opt/kmakise/${pkgname%-mono}/${pkgname%-mono}.exe "\$@"
EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.kmakise.keyboard.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname%-mono}
Comment=${pkgname%-mono}
Categories=Education;Electricity;

Icon=${pkgname%-mono}
Exec=${pkgname%-mono}
Terminal=false

EOF
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.kmakise.keyboard.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.kmakise.keyboard</id>

  <name>keyboard</name>
  <summary>keyboard</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>MIT</project_license>

  <description>
    <p>
      TeachingApp MCU Exunit: 键盘演示程序。（mono 下不支持 Linux 的串口功能。只能使用键盘）。
    </p>
  </description>

  <launchable type="desktop-id">io.github.kmakise.keyboard.desktop</launchable>
</component>
EOF
}
# vim: ts=4 sw=4 et
