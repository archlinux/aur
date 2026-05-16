# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=rspl
pkgver=r238.gf49ce31
pkgrel=1
pkgdesc="High level language for the Nintendo 64's RSP"
arch=(any)
url='https://github.com/HailToDodongo/rspl'
license=(Apache-2.0)
depends=(nodejs sh)
makedepends=(git yarn)
source=(
  "$pkgname::git+$url#commit=f49ce31f23d93d7be0609dfcd3a91a1c2acb1a48"
  wrapper.sh
)
sha512sums=('a7f7d1e9337d7fdc987196d1172103a703bf2d2d05d2eb546e923e6bf22155e7a6c2e09d7b6fcd65226cf221640200337a032103f889a6e017d43cb36d610cac'
            'a9df7bd1df2713345b425e8a947861f682d7a0ceee1a2c5152cd70c0f46d7cf2b051cf6fc667052d10aa49840b3ef552182a81494bcf31c41274fa8f77b543b0')
b2sums=('bd8a94c113a58e2e2df711390f32e6851c2cb116fa157da98ec2e0abaa7c29adbf03931395513a89efdc9b2b0292a1ea66afd861cc551c3b5e22b94d018d1bb1'
        '706f1dd3dc9b54a73514d5fe7762337d714b5902d778159173147e6b91ddfd868a35ba04aafe9e98565b7d29f42efab6727d93e1fb4d1c5467e8bc035afc4bba')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  yarn install
}

build() {
  cd "$pkgname"

  yarn build:cli
}

package() {
  cd "$pkgname"

  # compiled code
  install -vDm644 -t "$pkgdir/usr/lib/rspl" dist/cli.mjs

  # wrapper script
  install -vDm755 "$srcdir/wrapper.sh" "$pkgdir/usr/bin/rspl" 

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
