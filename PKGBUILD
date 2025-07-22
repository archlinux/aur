# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=serproid
pkgver=2.1.5
pkgrel=2
pkgdesc='PKCS#11 driver for cloud-based digital certificates issued by Serpro'
arch=('x86_64')
url='https://serproid.serpro.gov.br'
license=('custom')
depends=('java-runtime>=23' 'java-openjfx' 'openssl' 'gcc-libs' 'bash')
makedepends=('tar')
source=("serproid"
        "https://storagegw.estaleiro.serpro.gov.br/instalador-desktop/SerproID-$pkgver-amd64.deb")
sha256sums=('25dce11075985ae2c0178d46290995a0ea1e91d572e14f80b6ddcc4882fd21ec'
            'd2f3764654c14a15c47848506351e82e17e4ea305b2c130ae2ad761fb2d0c7d1')

package() {
  tar --zstd --no-same-owner -xf data.tar.zst

  rm -rf ./usr/share/serproid-desktop/jre
  cp -dr --preserve=mode,timestamp ./usr "$pkgdir/"

  install -m755 serproid "$pkgdir/usr/bin/serproid"
}
