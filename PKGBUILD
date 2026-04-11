# Maintainer: yhshzh0 <yhshzh0@gmail.com>

pkgname=tang-dynasty-bin
pkgver=6.2.2
pkgrel=1
pkgdesc="Tang Dynasty FPGA/EDA toolchain (official binary release)"
arch=('x86_64')
url="https://www.anlogic.com/"
license=('custom')
conflicts=('tang-dynasty')
options=(!strip)

depends=(
  'glibc'
  'libx11'
  'gtk2'
  'libxext'
  'libxrender'
  'libxrandr'
  'libxinerama'
  'libxcb'
  'libxkbcommon'
  'fontconfig'
  'freetype2'
  'dbus'
  'udev'
)

source=(
  "TD_Release_2026.1_NL.zip::https://anlogic.oss-cn-shanghai.aliyuncs.com/web_doc/%E5%B7%A5%E5%85%B7%E4%B8%8E%E8%B5%84%E6%96%99%E4%B8%8B%E8%BD%BD/%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/TD_Linux/TD_6.2/ggshdjsgkdjh/TD_Release_2026.1_NL.zip"
  "tang-dynasty.desktop"
  "tang-dynasty.png"
  "99-anlogic-jtag.rules"
)

sha256sums=(
  'a8be7c035846487723d7c48f09a9aeac49c7b0b7cc4d0491b94daec74e7201db'
  '40c810053bf8044eb20238ace006ff973622e6793e4ec339fdc571ae1399c203'
  'c7518eb2fe0ebafbeadba36a80616892403e89338eb8392aedaeb24ecfbb6040'
  'a4fe58538e15635dc3ed8688d312c006ba959b2d456c57fd0e445975632ef7e0'
)

package() {
  install -dm755 "$pkgdir/opt"
  cp -a "TD_Release_2026.1_NL" "$pkgdir/opt/$pkgname"

  chmod 755 "$pkgdir/opt/$pkgname/bin/td"
  chmod 755 "$pkgdir/opt/$pkgname/bin/td.sh"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tang-dynasty" << 'EOF'
#!/bin/bash
exec /opt/tang-dynasty-bin/bin/td.sh "$@"
EOF

  install -Dm644 tang-dynasty.desktop \
    "$pkgdir/usr/share/applications/tang-dynasty.desktop"
  install -Dm644 tang-dynasty.png \
    "$pkgdir/usr/share/pixmaps/tang-dynasty.png"

  # udev rules
  install -Dm644 99-anlogic-jtag.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-anlogic-jtag.rules"
}

