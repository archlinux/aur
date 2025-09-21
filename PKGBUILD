# Maintainer: rzhli <tayuebuliuhen@gmail.com>
# Contributor: rzhli <tayuebuliuhen@gmail.com>

pkgname='ftnn-desktop'
pkgver='15.33.13208'
pkgrel=1
pkgdesc="FTNN富途牛牛桌面版"
arch=('x86_64')
url="https://www.futunn.com/"
license=('unknown')
depends=('glibc' 'qt5-base' 'hicolor-icon-theme')
sha256sums=('SKIP')
source=("https://softwaredownload.futunn.com/FTNN_desktop_${pkgver}_amd64.deb")
# 如果 .deb 文件在本地
# source=("local://FTNN_desktop_${pkgver}_amd64.deb")

package() {
  # 解压 .deb
  bsdtar -xf "${srcdir}/FTNN_desktop_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # 设置权限
  chmod +x "${pkgdir}/opt/FTNN/FTNN"

  # 创建可执行链接
  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/FTNN/FTNN "${pkgdir}/usr/bin/ftnn"

  # 安装图标（app.png）
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -m644 "${pkgdir}/opt/FTNN/app.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ftnn.png"

   # 添加 .desktop
  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/ftnn.desktop"
[Desktop Entry]
Name=FTNN 富途牛牛
Comment=Trade Hong Kong, US, and China A-shares
export QT_SCALE_FACTOR=2.0 # 尝试 1.25, 1.5, 2.0 等值
Exec=ftnn
Icon=ftnn
Terminal=false
Type=Application
Categories=Finance;Network;
StartupWMClass=FTNN
EOF
}
