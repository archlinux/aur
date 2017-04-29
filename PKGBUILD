# Maintainer: Bian Jiaping <ssbianjp@gmail.com>

pkgname=china-ip-skip-vpn
pkgver=0.1.0
pkgrel=1
pkgdesc='中国大陆 IP 不走 VPN'
arch=('any')
url='https://github.com/bianjp/china-ip-skip-vpn'
license=('MIT')
depends=('iproute2' 'ppp' 'networkmanager')
source=(
  'ip-pre-up.sh'
  'ip-up.sh'
  'ip-down.sh'
  'china-ip-list.txt'
  'update-china-ip-list.sh'
  'update-china-ip-list.service'
  'update-china-ip-list.timer'
)
md5sums=(
  'f584c7fad35666a1b389991bfd378bef'
  'd44ff597167f88f6c237b2348613cc4c'
  '35e83248d720c3c5b2b222f7a4649011'
  '767141afaa848e13152867a3fd75049b'
  'f04893808d9870d26dc3de2130d0271b'
  '136e74953f7c3a8a017e17adf7106d87'
  'cdf3c9ea9d50caeea0e26320858587ec'
)

package() {
  install -D -m 755 ip-pre-up.sh "$pkgdir/etc/NetworkManager/dispatcher.d/pre-up.d/01-china-routes.sh"
  install -D -m 755 ip-up.sh "$pkgdir/etc/ppp/ip-up.d/01-china-routes.sh"
  install -D -m 755 ip-down.sh "$pkgdir/etc/ppp/ip-down.d/01-china-routes.sh"

  install -D -m 644 china-ip-list.txt "$pkgdir/etc/china-ip-skip-vpn/china-ip-list.txt"
  install -D -m 755 update-china-ip-list.sh "$pkgdir/usr/bin/update-china-ip-list"

  install -D -m 644 update-china-ip-list.service "$pkgdir/usr/lib/systemd/system/update-china-ip-list.service"
  install -D -m 644 update-china-ip-list.timer "$pkgdir/usr/lib/systemd/system/update-china-ip-list.timer"
}
