# Maintainer: Mautamu mautam@usa.com
pkgname=leftwm-theme-git
pkgver=r31.e133c21
pkgrel=1
epoch=2
pkgdesc="Theme manager for LeftWM"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm-theme"
license=('BSD')
depends=('leftwm' 'openssl' 'gcc-libs' 'zlib')
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
provides=('leftwm-theme')
conflicts=('leftwm-theme')
source=("${pkgname}::git+https://github.com/leftwm/leftwm-theme.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  cargo +nightly build --release
}

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  $pkgname/LICENSE
  cd $pkgname/target/release
  install -Dm755 leftwm-theme -t "$pkgdir"/usr/bin
}
