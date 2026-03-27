# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=serproid
pkgver=2.1.6
pkgrel=1
pkgdesc='PKCS#11 driver for cloud-based digital certificates issued by Serpro'
arch=('x86_64')
url='https://serproid.serpro.gov.br'
license=('custom')
depends=('java-environment>=25' 'java-openjfx' 'openssl' 'gcc-libs' 'bash')
makedepends=('tar')
source=("serproid"
        "https://storagegw.estaleiro.serpro.gov.br/instalador-desktop/SerproID-$pkgver-amd64.deb")
sha256sums=('6b9104609aa7866587827686f67a040841ab57aeb6cf4c7fcd03ff7771c3ffd0'
            '0ffa9ffe5bc343cc758a12f28bd7f08aec4b6e843d1c043baf0b81572461e588')

package() {
  tar --zstd --no-same-owner -xf data.tar.zst

  rm -rf ./usr/share/serproid-desktop/jre
  cp -dr --preserve=mode,timestamp ./usr "$pkgdir/"

  install -m755 serproid "$pkgdir/usr/bin/serproid"
  ln -s libserproidp11.so "$pkgdir/usr/lib/libneoidp11.so"
}
