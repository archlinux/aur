# Maintainer: Manish Khadka <manish.khadka@ttutanota.com>

pkgname=awscli-bin
pkgorg=aws
pkgver=2.13.5
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
sha256sums_x86_64=('ffae07131d099096a5cc3f3eda5701deb7059f90eeb927a22d1b24d599e51fd0')
sha256sums_aarch64=('9ed33af7a00b17ddb11f69a91424f682a559aeb0688d3b7596c3f815a6f45335')

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
