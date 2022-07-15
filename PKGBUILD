# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgbase=passenger-pm-git
pkgname=passenger-pm-git
pkgver=1.0
pkgrel=1
pkgdesc="Source version of Passenger Password Manager. Use your own algorithm."
arch=('x86_64')
url="https://github.com/Elagoht/Passenger"
license=('GPL')
replaces=("passenger-pm-bin")
conflicts=("passenger-pm-bin")
provides=("passenger-pm")
depends=("python3"
  "python-pyqt5"
  "python-pyperclip")
optdepends=('git: sync passwords with git repo')
source=("PassengerLinuxInstaller.tar.gz::https://github.com/Elagoht/Passenger/releases/download/v$pkgver/PassengerLinuxInstaller.tar.gz")
sha256sums=('610f1cc3adbbf6ef68d510ac719eaeb0d3a2a685ae951752865fb323b21cd0c2')
pkgver() {
  printf "$pkgver"
}
package() {
  printf "\e[0;32;1m==>\e[0m PASSENGER GIT VERSION IS NOT SECURE BY DEFAULT YOU NEED TO USE YOUR OWN ENCODING/DECODING ALGORITHM TO USE SAFELY. IF YOU DO NOT KNOW HOW TO CREATE AN ALGORITHM, SIMPLY INSTALL passenger-pm-bin PACKAGE INSTEAD.\nContinue to installation [y/N]: "
  read approve
  if [[ $approve = "y" || $approve = "Y" ]]; then
    sed -i "s/Exec\=passenger/Exec\=\/usr\/share\/Passenger\/Passenger/" Passenger.desktop
    mv -fv "passenger.py" "Passenger/Passenger"
    mv -fv *.py "Passenger"
    install -d "$pkgdir/usr/share/applications"
    cp -vr "Passenger" "$pkgdir/usr/share"
    install -Dm644 "Passenger.desktop" -t "$pkgdir/usr/share/applications"
    rm -r *
  else
    printf "\e[0;31;1m==>\e[0m Installation aborted by user.\n"
    exit 1
  fi
}