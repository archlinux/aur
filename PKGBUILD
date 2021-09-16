# Maintainer: EndeavourOS-Team <info@endeavouros.com>

pkgname=reflector-simple
pkgdesc="Simple GUI wrapper for 'reflector'."
pkgver=2021.08.17
pkgrel=1
arch=('any')
license=('GPL')
depends=(
  reflector whois geoip bind-tools
  eos-bash-shared
)
optdepends=(
  'reflector-bash-completion: useful for plain reflector usage'
)
backup=(
  etc/$pkgname.conf
  etc/$pkgname-tool.conf
)

url=https://github.com/endeavouros-team/PKGBUILDS
_commit=a4727ec460b22a0853de4245a9d09f9f955ae969

source=(
  $url/raw/$_commit/$pkgname/$pkgname
  $url/raw/$_commit/$pkgname/$pkgname.desktop
  $url/raw/$_commit/$pkgname/$pkgname.conf
  $url/raw/$_commit/$pkgname/$pkgname-tool.conf
  $url/raw/$_commit/$pkgname/mirrorlist-rank-info
  $url/raw/$_commit/$pkgname/eos-latest-arch-mirrorlist
)
sha512sums=('1637cf77f63cee0706f2f8774f32a8fe40d944915e46aeee7f0426d77b149f7dbd6477abfeac3b47e2d69a677a30dac19c71aa834d7543a913686a1bf77cc5e2'
            '3435d083e8df72f17a291cca4c3cc62ac7824d1f528e746bf689f8962159fbdd97b6a57d45b3b379a2191e2e49536b77040b13d704a58753fbed00017f4403d0'
            'aa149c8fc273e6a9fb5ddc38bde8a37b8fb095ec8877a324b957be57e156ef583adbed5988f0184ef06d5d09ec13e01e4a58b81fffef5d6d316405a3881895c3'
            '8b101caac9f38238d30f293176a09f1bb483ec1cdc474ef126ec087a8b548b50eee5c35617f0616dd1618e4dce72e14b70270f47658577e20e04a133405510aa'
            'c56090338b01f6eb251e3250d69d32c2b96c8393ebe921896de3ad1bd5c622c01ae637a09c6d0d0aa40e71d55be608a8d77066be05929d586723e79e0f24002c'
            'ceac82fa40741acaba6e7bf9aa0de869ab19a1f166b2ac298521e731de4201291a5cc238024e5eb74a85a9014e65b936dccd265d4a5196d7722cbe891c0f6bff')

package() {
  cd $srcdir

  sed -i $pkgname -e "s|local VERSION_INFO=.*$|local VERSION_INFO=$pkgver-$pkgrel|"

  install -d $pkgdir/usr/bin
  install -d $pkgdir/etc
  install -d $pkgdir/usr/share/applications

  install -Dm755 $pkgname                     $pkgdir/usr/bin/$pkgname
  install -Dm755 eos-latest-arch-mirrorlist   $pkgdir/usr/bin/eos-latest-arch-mirrorlist
  install -Dm755 mirrorlist-rank-info         $pkgdir/usr/bin/mirrorlist-rank-info
  
  install -Dm644 $pkgname.conf         $pkgdir/etc/$pkgname.conf
  install -Dm644 $pkgname-tool.conf    $pkgdir/etc/$pkgname-tool.conf
  install -Dm644 $pkgname.desktop      $pkgdir/usr/share/applications/$pkgname.desktop
}
