# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com_

pkgname=dracut
pkgver=044
pkgrel=3
pkgdesc="Generic, modular, cross-distribution initramfs generation tool"
arch=("i686" "x86_64")
url="https://dracut.wiki.kernel.org/"
license=("GPL")
depends=("cpio" "dash" "kbd" "kmod" "util-linux" "systemd>=199" "bash>=4.0")
optdepends=("cryptsetup: Part of the Crypto setup"
	"dmraid: Part of the Raid setup"
	"lvm2: Part of the LVM setup"
	"mdadm: Part of the MDadmin thing"
	"kexec-tools: For switch kernels without reboot support")
makedepends=("docbook-xsl" "asciidoc")
backup=("etc/dracut.conf")
install="dracut.install"
source=("http://www.kernel.org/pub/linux/utils/boot/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin \
	      --libdir=/usr/lib --libexecdir=/usr/lib/dracut \
	      --systemdsystemunitdir=/usr/lib/systemd/system \
	      --bashcompletiondir=/usr/share/bash-completion/completions \
	      --sysconfdir=/etc --loginstalldir=/var/log/dracut 
  make sysconfdir=/etc prefix=/usr \
  	bindir=/usr/bin sbindir=/usr/bin \
  	libdir=/usr/lib libexecdir=/usr/lib/dracut \
	systemdsystemunitdir=/usr/lib/systemd/system \
	bashcompletiondir=/usr/share/bash-completion/completions \
	sysconfdir=/etc loginstall=/var/log/dracut
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" sysconfdir=/etc prefix=/usr \
	bindir=/usr/bin sbindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib/dracut \
	systemdsystemunitdir=/usr/lib/systemd/system \
	bashcompletiondir=/usr/share/bash-completion/completions \
	sysconfdir=/etc loginstall=/var/log/dracut install
}
#I use md5sum because is the default in "makepkg -g", blame Allan McRae
md5sums=('fbb8b6aea24c2f7d328021bbf11788fd')
