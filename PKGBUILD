# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=7.00.29701.851
pkgrel=1
pkgdesc='Static code analyzer for C, C++ and C#'
arch=('i686' 'x86_64')
url=http://www.viva64.com/en/$pkgname
license=('unknown')
depends_i686=('qemu-headless-arch-extra')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code'
            'bash-completion: for bash completion'
            'strace: for analyzing via using strace logs')
options=('!strip')
install=$pkgname.install
source=(http://files.viva64.com/$pkgname-$pkgver-${arch[1]}.tgz)
source_i686=($pkgname.binfmt.d)
sha256sums=('609f9a22c3e873eb99005cfe1cb0cd728416fc53adb029c0389bdaba03299a59')
sha256sums_i686=('fd7b1f7b48aa84205c1c0f60f630f1a33504e0e4904c5b0e8ae2477494899c97')

package() {
  if [ $CARCH == ${arch[0]} ]; then
    install -D -m 644 $pkgname.binfmt.d $pkgdir/usr/lib/binfmt.d/$pkgname.conf
  fi

  cd $srcdir/$pkgname-$pkgver-${arch[1]}/bin
  install -D -m 755 -t $pkgdir/usr/bin \
    $pkgname \
    $pkgname-analyzer \
    plog-converter

  cd $srcdir/$pkgname-$pkgver-${arch[1]}/etc/bash_completion.d
  install -D -m 644 -t $pkgdir/etc/bash_completion.d $pkgname.sh
}
