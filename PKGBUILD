# Maintainer: Joshua Williams <jjoshau@pm.me>

pkgname=plexamp-headless
pkgver=4.11.2
pkgrel=2
pkgdesc="Headless music client for Plex"
provides=('plexamp-headless')
conflicts=('plexamp-headless')
arch=('aarch64')
depends=('pipewire-alsa' 'nvm')
url="https://plexamp.com"
options=(!debug !strip)
_filename=Plexamp-Linux-headless-v${pkgver}.tar.bz2
source=("https://plexamp.plex.tv/headless/${_filename}"
	'plexamp-headless.service'
	'plexamp-headless.sh')
sha512sums=('715812f2fc5a76dd2f699189ed7fd7e88c9a061076159f03c8fa935460a51b750905194089f281ec92a7299a80db981e9be53068b44592faba477da4732dd315'
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
