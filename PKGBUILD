# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pgyvpn
_pkgname=PgyVPN
pkgver=2.2.0
pkgrel=1
pkgdesc="Suitable for business personnel long-distance intelligent network access"
arch=("x86_64" "i686")
url="https://pgy.oray.com/download/"
license=('custom')
source=('LICENSE::https://service.oray.com/question/1820.htm')
source_x86_64=("http://download.oray.com/pgy/linux/${_pkgname}_Ubuntu_${pkgver}_X86_64.deb")
source_i686=("http://download.oray.com/pgy/linux/${_pkgname}_Ubuntu_${pkgver}_i386.deb")
sha256sums=('849387c971cd12f63c8b982e1dbcf9aa7b1a752d88bb41f5b112e1465cccc6e9')
sha256sums_x86_64=('a1cc519fd7d47605e293585adacefce4b8a6a5db9ff381f124ce9ee086e7fae8')
sha256sums_i686=('c2a3c7f4f1dd0d456de133988b166a7a37015fd0fc02cc3d3428a83061373431')

package() {
  tar -xf data.tar.gz -C ${pkgdir}

  install -dm755 ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/sbin/pgy* ${pkgdir}/usr/bin

  rm -rf ${pkgdir}/usr/sbin
  rm -rf ${pkgdir}/etc/init.d
  
  chmod -R 755 ${pkgdir}/usr/
  chmod -R 755 ${pkgdir}/etc/

  install -dm755 ${pkgdir}/usr/lib/systemd/system
  cat > ${pkgdir}/usr/lib/systemd/system/${pkgname}.service << EOF
[Unit]
Description=Running pgyvpn
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/pgyvpn -a
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF
}

# vim: ts=2 sw=2 et:
