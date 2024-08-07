# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=serproid
pkgver=2.1.1
pkgrel=1
pkgdesc='PKCS#11 driver for cloud-based digital certificates issued by Serpro'
arch=('x86_64')
url='https://serproid.serpro.gov.br'
license=('custom')
depends=('java-runtime' 'java-openjfx' 'openssl' 'gcc-libs' 'bash')
makedepends=('tar')
source=("serproid"
        "https://storagegw.estaleiro.serpro.gov.br/instalador-desktop/SerproID-$pkgver-amd64.deb")
sha256sums=('32c5e192db8f0b4472148293e737ac6718c81eaf285e3f9974c90e896fc91d5b'
            '20f47b93649c550293defa62fdb64b45cc7b7a22389fd252f953fdaeb76c8399')

package() {
  tar --zstd --no-same-owner -xf data.tar.zst

  rm -rf ./usr/share/serproid-desktop/jre
  cp -dr --preserve=mode,timestamp ./usr "$pkgdir/"

  install -m755 serproid "$pkgdir/usr/bin/serproid"
}
