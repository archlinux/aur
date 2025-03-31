# Maintainer: Joshua Williams <jjoshau@pm.me>

pkgname=plexamp-headless
pkgver=4.12.0
pkgrel=1
pkgdesc="Headless music client for Plex"
provides=('plexamp-headless')
conflicts=('plexamp-headless')
arch=('aarch64')
depends=('nvm')
url="https://plexamp.com"
options=(!debug !strip)
_filename=Plexamp-Linux-headless-v${pkgver}.tar.bz2
source=("https://plexamp.plex.tv/headless/${_filename}"
	'plexamp-headless.service'
	'plexamp-headless.sh')
sha512sums=('aad7b375f18548648cda4ff8b2dd7fbbd1a2d83fbdbc6d55fb9a5f503f025122b0e2be5d751b6e83ad977d86bde37929e8a30933c7910a77ebc2d1d276163dbe'
            '83a94e4b933981eae7b944ae7ad822a6da6502c0a22b7fb2af845787ee0bf272eeae6853074ac1b1b2711c2c39e1b6506394dedc159b318c12c8f0cb04c220ea'
	    '6d9208af95e016b1c59ba1e2629913a7dfc9f138e3ff4fd5a4e491b17c825d5837e23756c8e3d7b4d4cb8544b1cb614cc179677d97168fcf77a1a4b17182983e')

prepare() {
  rm -rf "$srcdir"/plexamp/plexamp.service "$srcdir"/plexamp/upgrade.sh
}

package() {
  install -d "$pkgdir"/opt
  cp -r plexamp "$pkgdir"/opt/plexamp-headless
  install -Dm755 plexamp-headless.sh "$pkgdir"/usr/bin/plexamp-headless
  install -D plexamp-headless.service "$pkgdir"/usr/lib/systemd/user/plexamp-headless.service
}
