# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=hid-apple-patched-git
_pkgname=hid-apple-patched
pkgver=20151017.556a3c2
pkgrel=1
pkgdesc=" Allows to swap the Fn key and left Control key on Macbook Pro and Apple keyboards in GNU/Linux"
url="https://github.com/free5lot/hid-apple-patched"
arch=('any')
license=('GPL3')
depends=('linux-headers')
makedepends=('git')
install="$_pkgname".install
source=("git+https://github.com/sami-mw/hid-apple-patched.git#branch=update-makefile" "hid-apple-patched.conf")
sha256sums=('SKIP'
            '4b94f1f55febddad5ff60a8918487b883ceadd4e6c3fb280e98e4e235cd09663')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  cd "$srcdir"/"$_pkgname"
  make
}

package() {
  cd "$srcdir"/"$_pkgname"
  make install INSTALL_MOD_PATH="$pkgdir"
  mkdir "$pkgdir"/usr
  mv "$pkgdir"/lib "$pkgdir"/usr
 
  cd "$srcdir"
  mkdir -p "$pkgdir"/etc/depmod.d
  install -m600 hid-apple-patched.conf "$pkgdir"/etc/depmod.d
}

