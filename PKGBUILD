# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=kiftd
pkgver=1.0.35
pkgrel=2
pkgdesc="kiftd是一款专门面向个人、团队和小型组织的私有网盘系统。轻量、开源、完善。"
arch=('any')
url="https://github.com/KOHGYLW/kiftd"
license=('custom')
depends=('java-runtime>=8')
provides=('kiftd-git')
conflicts=('kiftd-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KOHGYLW/${pkgname}/archive/v${pkgver}-release.tar.gz"
        "${pkgname}.sh")
sha256sums=('9fe7699cf8f11bf9d035ad599c22cb09200d5701644d9deb48dce5e86d7478d1'
            'cc558720e8460299aa9856a6b3bf6661a62fb60438932dd81a9041be88dbee14')

package() {
  cd ${pkgname}-${pkgver}-release
  
  install -Dm644 使用许可 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 kiftd说明文档.pdf ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}_manual.pdf
  rm  kiftd说明文档.pdf README.md 使用许可

  install -Dm644 webContext/css/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png 
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  
  install -dm755 ${pkgdir}/usr/share/java/${pkgname}
  mv * ${pkgdir}/usr/share/java/${pkgname}

    install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  cat > ${pkgdir}/usr/lib/systemd/system/${pkgname}.service << EOF
[Unit]
Description=Kiftd--私有网盘系统
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/${pkgbase} -start

[Install]
WantedBy=multi-user.target
EOF
}

# vim: set sw=2 ts=2 et:
