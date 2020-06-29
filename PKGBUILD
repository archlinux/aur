# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Janne Heß <jannehess@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm
pkgver=1.0.6
pkgrel=2
pkgdesc='Multi-panel tabbed file manager'
arch=(i686 x86_64)
url="https://ignorantguru.github.io/spacefm/"
license=(GPL3)
depends=(gtk3 startup-notification ffmpegthumbnailer)
makedepends=(intltool gcc8)
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
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/spacefm-glibc-2.28-compatibility.patch")
sha256sums=('fedea9fcad776e0af4b8d90c5a1c86684a9c96ef1cdd4e959530ce93bdebe7c9'
            '12411055df994211d2968cb52746b6caefce6926aed1ed33b542bd70b571ce7e')

export CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i ../spacefm-glibc-2.28-compatibility.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --with-gtk3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
