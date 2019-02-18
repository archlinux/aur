# Maintainer: Steven Seifried <gitlab@canox.net>
pkgname=spdynu
pkgver=2018.11
pkgrel=0
pkgdesc="An Dynamic DNS Client for spdyn.de"
arch=('any')
url="https://gitlab.com/CANOXNET/spdynu"
license=('GPL2')
#depends=('')
makedepends=('gcc')
source=(git+https://gitlab.com/CANOXNET/spdynu)
install=
md5sums=('SKIP')

package() {
  mkdir -p "${srcdir}/tmp"
  cd "${srcdir}/tmp"
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynUpdater.c
  gcc spdynUpdater.c -o spdynu
  sudo chmod u+x spdynu
  sudo cp -r spdynu /usr/bin/spdynu
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.conf
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/aur/spdynu.service
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.timer
  sudo cp -r spdynu.conf /etc/spdynu.conf
  sudo cp -r spdynu.service /etc/systemd/system/
  sudo cp -r spdynu.timer /etc/systemd/system/
  sudo systemctl enable spdynu.service
  sudo systemctl enable spdynu.timer
  sudo systemctl start spdynu.service
  sudo systemctl start spdynu.timer
  echo -e "\033[31m\033[1m\033[4mThe systemd Service and Timer was automatically enabled and started\033[0m"
  echo -e "\033[31m\033[1m\033[4mDon't forget to edit /etc/spdynu.conf\033[0m"
}
