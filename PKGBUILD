# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=("etc/${pkgname%-bin}.conf")
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6=(  $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7l=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-i686.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
sha512sums=('a0cd6e5cf5681f080afabb0d1541fd04d33100920de932e65975d6214e23268c6edfacc8880f25a79e9d49eb592215c935a05d6e7ca58924861e1c8faf7eca3e')
sha512sums_aarch64=('fbf6219e636e12e413a1822bf4af465ad88d6013706b3d96e61b743da02be2972b880bc0992bd6dc61e15d9b6f83baaa5d64e1071b149e2676f02c9397e7040d')
sha512sums_armv6=('deb8fdadd8c63f97b5697e196fc7cce9c099237442eb032823241e856c528605bec4d489880a6f1a511ad8043d4fff671f34b8d5389a701b4bd7b27ca1eff486')
sha512sums_armv7l=('2800570f065c986ead2ae361daddcbe9be1f4b3ce84086e9d49e6feb903f7cad6b2118215cdf70e7c44a325d99fc7a7d8f6ef6f478ef1702d94333c9dbc25d03')
sha512sums_i686=('e55f78dd91260458eeba7e04b1c4908b7911be9f21da7832e89dcb6168bf2809ba8bc4640ffbde130103fd389334e32bdd1085fe3bb256150e6457ac206f956b')
sha512sums_x86_64=('8e2237862145de03e3ae780a4b61cf20edee3cbd8d430a1b1a1a3f800d6dc7ba72f26014c68b452899924369e0b609a28ab410f219d1a39eba658f6825c7a7f4')
b2sums=('f17555f8ca7e6b5d930a7c921eb3b1b4cb350876775cbc28cf8b8e5aa11e67c5e689dbfb6f6d18e41d929de571d0fd615c0b95b4973fcf194f3842be89b37360')
b2sums_aarch64=('2e19be264f18524817c0a15ea624b901a6747b06de1f4733a8c4db1bd06e5779297ddceaf883e226dd9914bdacd7700773a962a0c8ac476521f7e9dc18ded0bc')
b2sums_armv6=('0b063906a21f0617e8634c5679470efae53bd8a2dc4ae9a43df2c91aa66fc14d787329143a1b3437850fdde730dbc1cfcf407de663f67b096f69ef07cfc15b03')
b2sums_armv7l=('748b4161a4f69b0e62281f06007359a84512f286791ea83a0241480f224b44d4d33f2295c0dfa0b24549e53b28a8de0603e5be62e995da8ae285e38e1402b6e4')
b2sums_i686=('1a1f0e0f44bb6fdca49a9e48219fc224c90ee739aeffd87cdef61594b47205e604979fea8d57c41d6d484eee69d0b8913593ab29c0c68aac7f420f1276f49609')
b2sums_x86_64=('7f8f57b13e30bc711c25fdbb16232cf1b66245a9e054c063c480478381e328fbace05436b77ed7adb814e8bff616e2bae6fdce747462ef7ffd93642990ca4ade')

prepare() {
  sed -i 's|ciadpi|/usr/bin/ciadpi|' ${pkgname%-bin}-$pkgver/dist/linux/${pkgname%-bin}.service  
}

package() {
  install -vDm 755 ciadpi-$CARCH "$pkgdir"/usr/bin/ciadpi
  cd ${pkgname%-bin}-$pkgver
  install -vDm 644 dist/linux/${pkgname%-bin}.conf -t "$pkgdir"/etc/
  install -vDm 644 dist/linux/${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
