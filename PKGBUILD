# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname="uasm"
pkgver=2.50
pkgrel=1
pkgdesc="Continued evolution of JWasm" # http://www.terraspace.co.uk/uasm.html#p1
arch=('x86_64')
url="http://www.terraspace.co.uk/uasm.html"
license=(
  'custom:JWasm License'
  'custom:Sybase Open Watcom Public License'
)
# options=(!strip debug)
source=(
  # 'uasm::git+https://github.com/Terraspace/UASM.git#branch=v5.0'
  'uasm::git+https://github.com/Terraspace/UASM.git#commit=41002d262d3a9d6ca737d72e86f6f1328d42478d'
  'uasm-default-nocolor.sh'
)
md5sums=(
  'SKIP'
  '16ee809dee22b3f4aa39536330b5c117'
)

build() {
  cd "$srcdir/$pkgname"
  make -f gccLinux64.mak
}

package() {
  cd "$srcdir/$pkgname"

  install -v -Dm755 GccUnixR/uasm "$pkgdir/usr/bin/uasm-color"
  install -v -Dm755 "$srcdir/uasm-default-nocolor.sh" "$pkgdir/usr/bin/uasm"

  install -v -dDm755 "$pkgdir/usr/share/doc/uasm"
  install -v -m644 Readme.txt History.txt Doc/* "$pkgdir/usr/share/doc/uasm/"

  install -v -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
