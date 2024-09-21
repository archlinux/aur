# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: xekarfwtos <xekarfwtos@gmail.com>
# Contributor: BartÅ‚omiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: jnbek <nospam@noemail.ru>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm-gtk2
_pkgname=spacefm
pkgver=1.0.6
pkgrel=2
pkgdesc='Multi-panel tabbed file manager'
arch=('x86_64')
url="https://github.com/IgnorantGuru/spacefm"
license=('GPL3')
conflicts=('spacefm')
provides=('spacefm')
depends=('gtk2' 'desktop-file-utils' 'startup-notification' 'ffmpegthumbnailer')
makedepends=('intltool' 'gettext')
optdepends=('lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/IgnorantGuru/spacefm/archive/$pkgver.tar.gz"
	    sysmacros.patch
        "https://github.com/FabioLolix/AUR-artifacts/raw/master/spacefm-Fix-GCC-10-build.patch")
md5sums=('d6b8e4e6829f444555bbc66c769bb84c'
         'e2a9092cd587020cdce0d711658d1bfd'
         'fcef671330488eeea81fac9f9293b799')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np0 -b -z .orig < ../sysmacros.patch
  patch -Np1 -i ../spacefm-Fix-GCC-10-build.patch
}

build() {
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-pixmaps \
    --with-gtk2
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
