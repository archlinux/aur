# Maintainer Eray Aydın <eray at erayaydin dot me>

pkgname=paintball-party-2
pkgver=0.856
_ver=0.856
pkgrel=1
pkgdesc="Paintball Party 2 is the sequel to Paintball Party, a multiplayer action platformer for all ages."
arch=('i686' 'x86_64')
url="http://www.t3-i.com/pages/download.php?id=8"
_download="http://www.t3-i.com/pages/download.php?id=8"
license=('custom')
changelog=$pkgname.ChangeLog

makedepends=('wget' 'allegro' 'mxml')
install=$pkgname.install
sha512sums=('44cf0528e95ddd7f13ca169c9870ed0a769245460d90bb3e216f3ad437d090b450bc904e8a9da1d43a26ec42d6081a8469570662d0ebb801277ed3896f715cd9'
			'c05077e670f0cc6d0819259c9e4ada33fd8adb023824f4a923b5dce85d4ea6d8fc10ba3f0328d8092b485d73fb6081e5ff8e586353a80fe838e8decc2880abae'
			'ebc6b1d5870808f3145bc63fb35b5ed04d7480791a91eeb2cbd7b43eade4932560cd7be7404f35e39e1d3c749def964a70c7e8498b6cc47590898d780042cff2'
			'bc65833b64262e1f0c114eefe0e9bc6a4a0aa0cd0e00769ec9906776cd4e162b6bec4e90b90182c78f90d3a63aab169b64a36c151504e1e2b89c1fb4ebe2f8c0')

source=(paintball_party_2-${_ver}-linux.tar.gz::"${_download}"
		"makefile"
		"pp2.png"
		"pp2.desktop")
options=(emptydirs)

build() {
  tar -zxvf paintball_party_2-${_ver}-linux.tar.gz

  mv makefile paintball_party_2-${_ver}/src/

  cd paintball_party_2-${_ver}/src/

  make
}

package() {
  
  # create folders
  install -d "$pkgdir"/{opt/paintball-party-2,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R paintball_party_2-${_ver}/bin/data "$pkgdir"/opt/paintball-party-2

  # executable
  install -m755 paintball_party_2-${_ver}/bin/pp2 "$pkgdir"/opt/paintball-party-2
  ln -s /opt/paintball-party-2/pp2 "$pkgdir"/usr/bin/paintball-party-2

  # desktop launcher
  install -Dm644 pp2.png "$pkgdir"/usr/share/pixmaps/pp2.png
  install -Dm644 pp2.desktop "$pkgdir"/usr/share/applications/pp2.desktop
}