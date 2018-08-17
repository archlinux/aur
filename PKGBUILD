# Maintainer: Janne Heß <jannehess@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm
pkgver=1.0.6
pkgrel=1
pkgdesc='Multi-panel tabbed file manager'
arch=('i686' 'x86_64')
url="https://ignorantguru.github.io/spacefm/"
license=('GPL3')
depends=('gtk3'
         'startup-notification'
         'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('dbus: dbus integration'
            'util-linux: disk eject support'
            'lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user'
            'pmount: mount as non-root user'
            'curlftpfs: mount FTP shares'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount cameras'
            'ifuse: mount your iPhone/iPod Touch'
            'fuseiso: mount ISO files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IgnorantGuru/spacefm/archive/${pkgver}.tar.gz"
        0001-glibc-2.28-compatibility.patch)
sha512sums=('37fc0dd31f02158502f592415b4c375ee49560af6f03d75b035d7c6c45bdc47064bba1ae8987b4cc8be2e02b3dfcdc17ec760411975e7b5f74343a2293fb2c8c'
            'e6a6b2cca04a0e503480493c967725319a82938be1e431e437c49967f9b5da4e442502159fc1583981af5336d5a1213379c377776460b2431b92aecf5c3cb084')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i ../0001-glibc-2.28-compatibility.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr \
		--disable-pixmaps \
		--with-gtk3
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
