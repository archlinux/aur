# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=sqlninja
pkgver=0.2.6
pkgrel=1
pkgdesc="SQL Server injection & takeover tool"
arch=(i686 x86_64)
url="http://sqlninja.sourceforge.net/"
license=('GPLv3')
optdepends=('metasploit-git')
provides=('sqlninja')
conflicts=('sqlninja')
source=("http://downloads.sourceforge.net/project/sqlninja/sqlninja/0.2.6-rc1/sqlninja-0.2.6-rc1.tgz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fsqlninja%2Ffiles%2Fsqlninja%2F0.2.6-rc1%2F&ts=1464896447&use_mirror=iweb")
md5sums=('ee0ceea3141a95967ce73417969decd8')

build() {
         echo Installing required dependencies
         sudo pacman -S perl-io-socket-ssl perl-dbi
         git clone https://aur.archlinux.org/perl-netpacket.git
         cd perl-netpacket
         makepkg
         sudo pacman -U perl-netpacket-1.6.0-1-any.pkg.tar.xz
         cd ..
         rm -rf perl-netpacket
         git clone https://aur.archlinux.org/perl-net-pcap.git
         cd perl-net-pcap
         makepkg
         sudo pacman -U perl-net-pcap-0.17-5*.pkg.tar.xz
         cd ..
         rm -rf perl-net-pcap
         sudo pacman -S perl-net-dns
         git clone https://aur.archlinux.org/perl-net-rawip.git
         cd perl-net-rawip
         makepkg
         sudo pacman -U perl-net-rawip*.pkg.tar.xz
         cd ..
         rm -rf perl-net-rawip
}

package() {
	cd sqlninja-0.2.6-rc1
        sudo cp -v sqlninja /usr/bin/sqlninja
}
