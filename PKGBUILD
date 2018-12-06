# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=proxyee-down
pkgver=3.4
pkgrel=2
pkgdesc="基于HTTP代理的百度网盘(Baidu)不限速下载，SwitchyOmega设置请参见项目主页说明"
arch=("any")
url="https://github.com/monkeyWie/proxyee-down"
license=('Apache License 2.0')
depends=('java-openjfx')
makedepends=('binutils')
source=("https://github.com/monkeyWie/proxyee-down/releases/download/${pkgver}/proxyee-down-main.jar"
	"https://raw.githubusercontent.com/proxyee-down-org/proxyee-down/master/main/src/main/resources/linux/logo.png")
md5sums=('f6f7a9a9ff12ec7a21c317b08ea1720b'
	 'fd11b401b063801e6eae898aae2fca8d')

package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp proxyee-down-main.jar "${pkgdir}/opt/${pkgname}"
  cp logo.png "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"
  chmod o+rw -R  .
  echo '/usr/bin/java -jar /opt/proxyee-down/proxyee-down-main.jar' > ${pkgname}
  chmod 755 ${pkgname}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

# add desktop.entry
  echo -e '[Desktop Entry] 
Name=Proxyee Down
Name[en_US]=Proxyee Down
Comment=Proxyee Down
Exec=/usr/bin/proxyee-down
Icon=proxyee-down
Terminal=false                      
Categories=Application;Network;
Type=Application' > ${pkgname}.desktop
  install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm 644 logo.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
}
