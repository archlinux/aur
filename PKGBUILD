pkgname=fgen
pkgver=0.1.6
pkgrel=1
pkgdesc='Generate images with your ChatGPT subscription from the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/prophesourvolodymyr/fuckinggen'
license=('WTFPL')
depends=('glibc')
makedepends=('rust' 'gcc')
source=("fgen-0.1.6.tar.gz::https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.6.tar.gz")
sha256sums=('cbfe544cf3151a154980b8d08544aba4063decb104e09189175cca93c9fac245')

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
