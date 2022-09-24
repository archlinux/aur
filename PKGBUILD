# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=aws-cli-v2-bin
pkgver=2.7.35
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services version 2'
arch=('aarch64' 'x86_64')
url='https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html'
license=('Apache')
provides=('aws-cli' 'aws-cli-v2')
conflicts=('aws-cli' 'aws-cli-v2')
makedepends=('unzip')
depends=('less')
source_aarch64=("https://awscli.amazonaws.com/awscli-exe-linux-aarch64-$pkgver.zip")
source_x86_64=("https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$pkgver.zip")
sha256sums_aarch64=('c8d75bf5377af7ecb3036a0928bd791d5ae01a0c7c2d274e90aff104def49428')
sha256sums_x86_64=('104579773a39fad7505343ceb5df0e40014994f8f6d8cc1610de00f954121039')

package() {
  $srcdir/aws/install -i "$pkgdir/usr/share/aws-cli" -b "$pkgdir/usr/bin" >/dev/null

  # Install binary symlinks
  BIN_DIR="/usr/share/aws-cli/v2/$pkgver/bin"
  for i in $pkgdir/$BIN_DIR/*; do
    ln -sf "$BIN_DIR/$(basename $i)" "$pkgdir/usr/bin/"
  done
  
  # Fix symlink for current version
  rm "$pkgdir/usr/share/aws-cli/v2/current"
  ln -s "/usr/share/aws-cli/v2/$pkgver" "$pkgdir/usr/share/aws-cli/v2/current"
}
