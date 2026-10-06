pkgname=fgen
pkgver=0.1.7
pkgrel=1
pkgdesc='Generate images with your ChatGPT subscription from the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/prophesourvolodymyr/fuckinggen'
license=('WTFPL')
depends=('glibc')
makedepends=('rust' 'gcc')
source=("fgen-0.1.7.tar.gz::https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.7.tar.gz")
sha256sums=('bc7438af5420ef89de029d6b498a7c0ebffc4d7caf43ca671a902fd6c6a9b6bf')

build() {
  cd "$srcdir/fuckinggen-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/fuckinggen-$pkgver"

  install -Dm755 target/release/fgen "$pkgdir/usr/bin/fgen"
  install -Dm755 target/release/fuckinggen "$pkgdir/usr/bin/fuckinggen"
  install -Dm644 skills/gpt-image-gen-latest/SKILL.md     "$pkgdir/usr/share/fgen/skills/gpt-image-gen-latest/SKILL.md"
  install -Dm755 install.sh "$pkgdir/usr/share/fgen/install.sh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/fgen/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/fgen/LICENSE"
}
