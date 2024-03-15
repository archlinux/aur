# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=SteamTokenDumper
pkgname=${_pkgname,,}-bin
# Hash from bottom of https://steamdb.info/tokendumper/
_source_hash=3eadaaacb713b2faa3f7498fe69dd7c2c4ea46dd588e9e3611f55916e9723e81
pkgver=r0.${_source_hash:0:7}
pkgrel=1
pkgdesc='Steam token dumper for SteamDB'
arch=('x86_64' 'x86_64_v3')
url='https://steamdb.info/tokendumper/'
license=('MIT')
backup=("opt/${pkgname%-bin}/$_pkgname.config.ini")
makedepends=('coreutils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("$_pkgname-linux-$pkgver.tar.gz::https://tokendumper.steamdb.info/SteamTokenDumper-linux.tar.gz?hash=$_source_hash")
sha256sums=($_source_hash)

package(){
  depends=('libz.so=1-64' 'glibc' 'gcc-libs')  # TODO: Depend on .so files instead of packages
  install -Dm755 SteamTokenDumper "$pkgdir"/opt/${pkgname%-bin}/SteamTokenDumper
  install -Dm644 SteamTokenDumper.config.ini "$pkgdir"/opt/${pkgname%-bin}/SteamTokenDumper.config.ini
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname%-bin}/LICENSE.txt
  install -d "$pkgdir"/usr/bin
  ln -s ../../opt/${pkgname%-bin}/SteamTokenDumper "$pkgdir"/usr/bin/$_pkgname
}
