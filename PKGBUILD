# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=2.1.10
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
sha512sums=('7179c117ee862588df6028564675c36a35cc6cc5c4ee1bcf813dbbe4824d595d6a04c4d26d6e4aaf954e1d89bf3796da9145fa89b15c33d772eddf19909c4726'
            '38d44600caf4a4cb06866eaf5ce136b4174a47fe7d9accff86d2a9464bfc2a0ddea88143fb356541188c5db4be0f5c90d11beef555c6c3857b4555f82343727e'
            '6b1a1f38d5f182c796e8eb3f8e3d1d908092c523f968975c9789cf3fb8ea315567f51742b3a84bc721719534912f4fd632ce5b9d941750a88890264943112ffe')

prepare() {
  cp fisher-up-me fisher-up
  patch fisher-up "$srcdir/fisher-up-me.patch"
}

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  fisherpath="${sharepath}/fisherman"
  install -Dm 755 fisher-up "${pkgdir}/usr/bin/fisher-up-me"
  # install Fisherman the global fish directory
  cd "${pkgname}-${pkgver}"
  install -Dm 644 fisher.fish "${fishpath}/functions/fisher.fish"
}
