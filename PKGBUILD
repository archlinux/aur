# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=jazz-midi-plugin-bin
pkgver=1.5.2
pkgrel=1
epoch=
pkgdesc="Jazz-Midi Plugin (support for midi in web browsers)"
arch=(x86_64)
url="https://jazz-soft.net/"
license=('unknown')
optdepends=(firefox chromium opera)
source=("https://jazz-soft.net/download/Jazz-Plugin/1.5.1/Jazz-Plugin-1-5-2.sh")
md5sums=('d6ccc8e27ac5121c8412f024ab61a407')

build() {
  echo $PWD
  sh Jazz-Plugin-1-5-2.sh --noexec --keep --target ./extracted
  # patch install file to copy content to pkg directory
  # note that this approach does not account for spaces in install script / build dir
  sed -i 's/\<sudo\>//;s/ \// $DESTDIR\//g' ./extracted/install.sh 
}

package() {
  cd ./extracted
  export DESTDIR="$pkgdir/"
  sh install.sh
  # use the following command if you have spaces in your build dir
  #proot sh install.sh
}
