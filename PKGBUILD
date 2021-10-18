# Maintainer: Funami
pkgname=pastel-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A command-line tool to generate, analyze, convert and manipulate colors"
arch=('x86_64' 'i686' 'armv6h' 'aarch64')
url="https://github.com/sharkdp/pastel"
license=('APACHE' 'MIT')
optdepends=(
  'bash-completion: for shell auto-completion'
  'fish: for shell auto-completion'
  'zsh-completions: for shell auto-completion'
)
provides=('pastel')
conflicts=('pastel')
source=('_pastel' 'pastel.bash' 'pastel.fish')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/sharkdp/pastel/releases/download/v$pkgver/pastel-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/sharkdp/pastel/releases/download/v$pkgver/pastel-v$pkgver-i686-unknown-linux-gnu.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::https://github.com/sharkdp/pastel/releases/download/v$pkgver/pastel-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/sharkdp/pastel/releases/download/v$pkgver/pastel-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
noextract=("$pkgname-$pkgver-x86_64.tar.gz"
           "$pkgname-$pkgver-i686.tar.gz"
           "$pkgname-$pkgver-armv6h.tar.gz"
           "$pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('2e7533977cbf9c32ed268bb802278574d1da6385a5aa44eb2da501c3328cf05b'
            'f3f9a39120baf972bf692879c400ee0f5dd1f91a339d22cb6dead01c363948ed'
            '85724eda0023ab6d7bab0f834603aebca74dda0cdbaa36ba01cbb955dae82aa8')
sha256sums_x86_64=('77efdada14929abe834cc7c77f11e1b91c11095f282cfb3633c4c9147bb93cb2')
sha256sums_i686=('0e9e1c525ec2462e4994c408d21599c7fecc68c6f6ecc6e75507fd7ae1a7ca2d')
sha256sums_armv6h=('04c7ebc763a3283e68a734a33f557cc5a3400c56aa091848cbc11e0b5d2fe4b3')
sha256sums_aarch64=('dcfb6f8a4ae31afe7f3f3dfc34cbd4bebab97bc3c666cbfc7d48c4cc829a3fb7')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH" --strip-components 1
}

package() {
  install -Dm644 _pastel "$pkgdir/usr/share/zsh/site-functions/_pastel"
  install -Dm644 pastel.bash "$pkgdir/usr/share/bash-completion/completions/pastel"
  install -Dm644 pastel.fish "$pkgdir/usr/share/fish/vendor_completions.d/pastel.fish"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 pastel -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/pastel"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/pastel"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/pastel"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/pastel"
}
