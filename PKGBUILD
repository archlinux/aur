# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=2.0.1
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish>=2.2.0' 'git')
optdepends=()
makedepends=('git')
conflicts=('fisherman-git')
install=fisherman-git.install
source=(
  "https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
  "https://git.io/fisher-up-me"
  "fisher-up-me.patch"
)
sha512sums=('68014ae28878d023df045b08ae17c42369c1afec487376f25616320369e90882737142eb9ba651789ef11b30676e424b3f2230386541940b37f7aa1e3a764a2c'
            '38d44600caf4a4cb06866eaf5ce136b4174a47fe7d9accff86d2a9464bfc2a0ddea88143fb356541188c5db4be0f5c90d11beef555c6c3857b4555f82343727e'
            'eb6e7360684c554541db1371af236922b5b213805a7547ce7bd7438e03d7baf8fa8c5fea1d60a381a49435956c02ba1b9552a55521b99783d9a104d2ba8aec48')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fisher-up-me.patch"
}

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  fisherpath="${sharepath}/fisherman"
  # install Fisherman the global fish directory
  cd "${pkgname}-${pkgver}"
  install -Dm 644 fisher.fish "${fishpath}/functions/fisher.fish"
}
