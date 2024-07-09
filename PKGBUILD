# Maintainer: Joshua Williams <jjoshau@pm.me>

pkgname=plexamp-headless
pkgver=4.11.0
pkgrel=1
pkgdesc="Headless music client for Plex"
provides=('plexamp-headless')
conflicts=('plexamp-headless')
arch=('aarch64')
depends=('nodejs-lts-iron' 'pipewire-alsa')
url="https://plexamp.com"
options=(!debug !strip)
_filename=Plexamp-Linux-headless-v${pkgver}.tar.bz2
source=("https://plexamp.plex.tv/headless/${_filename}"
	'plexamp-headless.service'
	'plexamp-headless.sh')
sha512sums=('a13f6bd643c0c92230c36fd242963491639432f8e352100a6b06fa04fd1a22f4d1a1d7f5b39c2351278d18ff72912e5440af05ae5a44c279bb5d62be9a553d65'
            '10412eecd39a2c8226b18f75089ff342653fa95c68d0e5f33393e1f34a08323f897e96c3f7a68348ecc040c4d35d29acd9368b151f2a6f2ae531cbb18063cf2c'
	    '26dd3d4c66fc267ae2f365f8cc2b0c46c12a1a5a96346cbfe0853675545e23723156b6d30b1208598dd406a488222035441179ff18b3716451146f1b0d87a114')

prepare() {
  rm -rf "$srcdir"/plexamp/plexamp.service "$srcdir"/plexamp/upgrade.sh
}

package() {
  install -d "$pkgdir"/opt
  cp -r plexamp "$pkgdir"/opt/plexamp-headless
  install -Dm755 plexamp-headless.sh "$pkgdir"/usr/bin/plexamp-headless
  install -D plexamp-headless.service "$pkgdir"/usr/lib/systemd/user/plexamp-headless.service
}
