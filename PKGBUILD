# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
pkgname=netbird-multiconfig

pkgver=1.0.2
pkgrel=1
pkgdesc="A small script to help with multiple netbird configs using the systemd template"

arch=('any')
license=('GPL-3.0-or-later')
depends=('netbird')

source=(
  "netbird-multiconfig.sh"
  "override.conf"
)

package() {
  cd "$srcdir/"

  install -Dm755 "netbird-multiconfig.sh" "${pkgdir}/etc/netbird-multiconfig.bash"
  install -Dm755 "override.conf" "${pkgdir}/usr/share/netbird-multiconfig/override.conf"

  NO_FORMAT="\033[0m"
  C_GREEN="\033[38;5;2m"

  printf "%b\n\n${C_GREEN}================================================================================================\n"
  printf "| Please add the following to your /etc/bash.bashrc:                                           |\n"
  printf "%b|${NO_FORMAT}                           source /etc/netbird-multiconfig.bash${C_GREEN}                               |\n"
  printf "|                                                                                              |\n"
  printf "| After that, you can create a systemd service override for netbird.service:                   |\n"
  printf "|%b${NO_FORMAT} # cat /usr/share/netbird-multiconfig/override.conf | systemctl edit --stdin netbird@.service ${C_GREEN}|\n"
  printf "================================================================================================\n\n"
}

sha256sums=('fa1171fbdbb567ecb0b5d125d31802126ff9b126ffff051e86aa08972348ccfb'
            '47d949c093ef91cdb6fe2289927f1ca2190639d6a46a9a8642ede283a7270027')
