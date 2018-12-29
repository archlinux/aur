# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: xekarfwtos <xekarfwtos@gmail.com>
# Contributor: BartÅ‚omiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: jnbek <nospam@noemail.ru>
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Contributor: ridikulus_rat <the.ridikulus.rat@gmail.com>

pkgname=spacefm-gtk2
_pkgname=spacefm
pkgver=1.0.6
pkgrel=1
pkgdesc='Multi-panel tabbed file manager'
arch=('x86_64')
url='http://ignorantguru.github.com/spacefm/'
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
source=($_pkgname-$pkgver.tar.gz::https://github.com/IgnorantGuru/spacefm/archive/$pkgver.tar.gz
	sysmacros.patch)
md5sums=('d6b8e4e6829f444555bbc66c769bb84c'
         'e2a9092cd587020cdce0d711658d1bfd')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np0 -b -z .orig < ../sysmacros.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-pixmaps --with-gtk2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
