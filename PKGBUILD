# Maintainer: fl0id <me@fl0id.eu>
pkgname=virt-p2v
pkgver=1.42.3
pkgrel=1
pkgdesc="Convert a physical machine to a virtual machine"
arch=(x86_64)
url="http://libguestfs.org/virt-p2v.1.html"
license=('GPL2')
depends=('perl-list-moreutils' 'xz' 'libvirt' 'libguestfs' 'libnbd' 'nbdkit')
makedepends=('perl-list-moreutils' 'binutils' 'mawk')
source=("https://download.libguestfs.org/virt-p2v/virt-p2v-${pkgver}.tar.gz" "virt-p2v.install")
sha256sums=("80e7bf6069c92bea349270b16ee40325dc6f814c3a06e0a0e329c86bd5d04f77"
	"05e57b3604be161ed9dbbada0b4c31bfc14b884cf4ff9cf887378d3b372689e4"
)
install=virt-p2v.install

prepare() {
  if [ ! -f /usr/lib/ocaml/nbd/META ] ;then
		echo "It seems you have built libnbd without ocaml binding. Please rebuilt libnbd with ocaml installed" >&2
	fi
	cd "${pkgname}-${pkgver}"
}

 #pcre2 libxml2 librsvg gtk3 dbus openssh which vim-tiny open-iscsi xorg-xinit xorg-server xf86-video-* ttf-dejavu metacity NetworkManager nm-connection-editor network-manager-applet dbus-x11 net-tools

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$srcdir/${pkgname}-${pkgver}"
#  make -k check
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
