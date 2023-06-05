# Maintainer: Manish Khadka <manish.khadka@ttutanota.com>

pkgname=awscli-bin
pkgorg=aws
pkgver=2.11.25
arch=('x86_64' 'aarch64')
pkgrel=1
pkgdesc="This package provides a unified command line interface to Amazon Web Services."
source_x86_64=("${pkgorg}-${pkgver}-x86_64.zip"::https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip)
source_aarch64=("${pkgorg}-${pkgver}-aarch64.zip"::https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip)
license=('MIT')
depends=(
        'glibc'
        'groff'
        'less'
        'unzip'
        )
sha256sums_x86_64=('0252933b8de10ea5d9f66cb48b1b9fe14e71d02646afeaf84486553ded527c4a')
sha256sums_aarch64=('9e79818cb1ab2a8a4a9c2f011d0d456663966a92ee88b762d4a5123a4b8b3b0c')

#build() {
#  cd $srcdir/awscli-${pkgver}
#}

package() {
  aarch=$(uname -m)
  if [[ $aarch == "x86_64" ]];
  then 
    unzip ${pkgorg}-${pkgver}-x86_64.zip
  fi

  if [[ $aarch == "aarch64" || $aarch == "arm64"  ]];
  then 
    unzip ${pkgorg}-${pkgver}-aarch64.zip
  fi

  cd aws
  ./install -i $HOME/.local/aws-cli -b $HOME/.local/bin --update
}
