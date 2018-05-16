# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=proxyee-down
pkgver=2.54
pkgrel=1
pkgdesc="基于HTTP代理的百度网盘(Baidu)不限速下载，SwitchyOmega设置请参见项目主页说明"
arch=("any")
url="https://github.com/monkeyWie/proxyee-down"
license=('Apache License 2.0')
depends=('jre8' 
	 'java-runtime-common')
makedepends=('unzip'
             'binutils')
source=("https://github.com/monkeyWie/proxyee-down/releases/download/${pkgver}/proxyee-down-${pkgver}-jar.zip")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  unzip -o proxyee-down-${pkgver}-jar.zip -d ${pkgdir}/opt
  mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"
  echo -e '#!/bin/bash \n 
           if [ $(archlinux-java get) != "java-8-jre/jre" ]; then 
                  echo -e "The default java environment should be java-8-jre/jre, not java-8-openjdk/jre. To use JRE 8, run  archlinux-java set java-8-jre/jre "; 
            else
                   /usr/bin/java -jar /opt/proxyee-down/proxyee-down.jar
            fi' >  ${pkgname}
  chmod o+rw -R  .
  chmod 755 ${pkgname}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
