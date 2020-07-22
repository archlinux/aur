# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=iotbot-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.6
pkgrel=1
pkgdesc="跨平台 QQ机器人 框架 原生 高效 迸发 Lua Plugin 只有你想不到"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/IOTQQ/IOTQQ"
license=('unknown')
provides=('iotqq' 'iotbot')
conflicts=('iotqq' 'iotbot')
backup=("usr/share/${_pkgname}/CoreConf.conf")
source=("${_pkgname}.sh")
install='.INSTALL'
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/97r6/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/97r6/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/eY7Q/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/eY7Q/${_pkgname}_${pkgver}_linux_arm.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6h.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/eY7Q/${_pkgname}_${pkgver}_linux_arm.tar.gz")
source_arm=("${_pkgname}-${pkgver}-arm.tar.gz::https://files.gitter.im/5e887cf2d73408ce4fdf42c5/eY7Q/${_pkgname}_${pkgver}_linux_arm.tar.gz")
noextract=("${pkgname}-${pkgver}-${CARCH}.tar.gz")
md5sums=('43921342c72ef2e7f89580ddd6b44be6')
md5sums_x86_64=('b2d785479f04c614285d001f05dff37b')
md5sums_i686=('e3a4d7b24b8015e4924b25efc687098e')
md5sums_aarch64=('1853b77c947fc995cd69e9d86ac5abc9')
md5sums_armv7h=('10b5d36703500d1c4d05f935c2086516')
md5sums_armv6h=('10b5d36703500d1c4d05f935c2086516')
md5sums_arm=('10b5d36703500d1c4d05f935c2086516')

prepare() {
  install -dm755 ${_pkgname}-${pkgver}-${CARCH}
  tar --strip-components=1 -xf ${_pkgname}-${pkgver}-${CARCH}.tar.gz -C ${_pkgname}-${pkgver}-${CARCH}  
}

package() {
  cd ${_pkgname}-${pkgver}-${CARCH}
  
  install -dm755 ${pkgdir}/usr/share/${_pkgname}
  install -dm755 ${pkgdir}/usr/lib/systemd/system/
  install -dm755 ${pkgdir}/etc/
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  
  mv * ${pkgdir}/usr/share/${_pkgname}
  ln -s /usr/share/${_pkgname} ${pkgdir}/etc/${_pkgname}
  
  cat > ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service << EOF
[Unit]
Description=IOTQQ/IOTBOT Service
After=network-online.target

[Service]
Type=simple
WorkingDirectory=/usr/share/${_pkgname}
ExecStart=/usr/share/${_pkgname}/${_pkgname}

[Install]
WantedBy=multi-user.target
EOF
}
# vim: set sw=2 ts=2 et:
