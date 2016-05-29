# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=sqlninja
pkgver=0.2.6
pkgrel=1
epoch=
pkgdesc="SQL Server injection & takeover tool"
arch=(i686 x86_64)
url="http://sqlninja.sourceforge.net/"
license=('GPLv3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('metasploit-git')
provides=('perl-dbi' 'perl-net-rawip' 'perl-net-dns' 'perl-net-pcap' 
'perl-netpacket' 'perl-io-socket-ssl')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/sqlninja/sqlninja/sqlninja-0.2.6-r1.tgz?r=&ts=1464479613&use_mirror=nbtelecom")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
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
	cd sqlninja-0.2.6-r1
        sudo cp -v sqlninja /usr/bin/sqlninja
}
