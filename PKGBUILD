# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=aws-cli-v2-bin
pkgver=2.7.33
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
sha256sums_aarch64=('a000d141387317ce8716a9a20c924ea140018749df991fb31d30fa1065f64aa6')
sha256sums_x86_64=('08e204959f85d8d905d0b31fa59bcb867f77dc7ee02555871a7ff98d40d94be5')

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
