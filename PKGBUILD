# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=jigdo
pkgver=0.7.3
pkgrel=1
pkgdesc="Distribute large images by sending and receiving the files that make them up"
arch=('i686' 'x86_64')
url="http://atterer.org/jigdo/"
license=('GPL2')
depends=('db' 'wget')
makedepends=('docbook-utils' 'docbook-sgml')
source=("http://atterer.org/sites/atterer/files/2009-08/$pkgname/$pkgname-$pkgver.tar.bz2"
	"00.richard_fixes.patch"
	"01.hardening.patch"
	"02.address_change.patch"
	"03.jigdo-lite-https.patch"
	"04.jigdo-lite-tmpdir.patch"
	"05.jigdo-lite-grep-options.patch"
	"06.jigdo-lite-store-filesPerFetch.patch")
sha512sums=('e183a2d93126935057244b9eb6bf6dadc1900cb17c36194f69e63a15d70ddfea81ce1167de5abfcdfd7507ac9fe6250a05be9d9d29392c961d44fde796158f7c'
            'a6d576aecdbba65d655e449b12dc9bf795db7db0d6aa2aa069265948c33509e633ed1936e74119539829b33e463bd2b90219cf69cd2ccaa2debd96d120a675ad'
            'cec50d1edd3f3e8d81b22069a61824b5d139e7e21dac919798630200e0610b6af43ebf17680918bd64ebb00f231ede9c5d5467d45136f4181210743c87345422'
            '23bc3b1037d655c707b6fb06ad167623db11bbae66741bc9a0d1b06fcd73b8c8272b4a15808354ee38d7cc27ce37328f98b277bf12de0ab47280a975268ecc2a'
            'e7642a3369959cb77f64431608b7a4f93565fe34cd186a6a808d82fb2ed6b5e17b1a1dc71ebaf455692df2d7f09d9b0a99b03e1df417120a4d30082baba6f1af'
            '6a01da354dd504e2670089d1646dcf548d2f3e840a2d7bda6e33bf7d5bda9ade70c6001c2da50805550c654a4752821ba4380b6ff43094e8336132cde94423e5'
            '465dc1518dd0d966e9e245bd79900c33e37a889228921b617fd78f1a15060f3bb6d0c39a0bbdb78752d435dd74ebfefefced0847556e3388f075caf54fb41fba'
            'e7b69d0aa1be31afb5960d51d090b0bff778e678cd09b50dd2725151211288148a91eead85fba72dd0d503bb9eb054d40465050719367d2cb0e0440d70ef23e2')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
	break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --without-gui --enable-nls --mandir=/usr/share/man
  make -j1
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
