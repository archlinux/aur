_name=zcash-swing-wallet-ui
pkgname="$_name-git"
pkgver=r138.2247791
pkgrel=3
pkgdesc="Desktop GUI Wallet for ZCash"
arch=('any')
url="https://github.com/vaklinov/zcash-swing-wallet-ui"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'apache-ant')
source=("$_name::git+https://github.com/vaklinov/zcash-swing-wallet-ui"
"launch.sh"{,.sig})
sha256sums=('SKIP'
            '16388c0c59bc17f7a2771ce9a4e5eb432be83809fb3577f067423fee002744cb'
            'SKIP')
sha512sums=('SKIP'
            '0df586929a226571a7624adefeb7ca053022089f4cd56a0dd09fb74fec14854a35dce083f596ab6c033eb7735e9c044337e7801c42e6f1356c5d40e84bc52e5a'
            'SKIP')

validpgpkeys=('7E0E7188BA50536DB5FCF07E45CE8E0631DED8DE')  # Richard Schwab

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name"
  ant -buildfile ./src/build/build.xml
}

package() {
  cd "$srcdir/$_name"

  install -Dm644 build/jars/ZCashSwingWalletUI.jar "${pkgdir}/usr/share/$_name/ZCashSwingWalletUI.jar"

  install -Dm755 ../launch.sh "${pkgdir}/usr/bin/zcash-swing-wallet-ui"
}
