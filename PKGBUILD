# Maintainer: Please see AUR package page for current maintainer contact information.

pkgname=btrfs-compress
# compress is too generic a name!!! Also the script is unmaintained upstream but still works.
_pkgname=compress
pkgver=1.0.0
pkgrel=2
epoch=1
pkgdesc="btrfs tool that makes it possible to change +c flags recursively on existing files"
arch=('x86_64')
url="https://github.com/benapetr/compress"
license=('BSD') 
depends=('python')
makedepends=('git')
source=("btrfs-compress-"$pkgver".tar.gz::https://github.com/benapetr/compress/archive/refs/tags/"$pkgver".tar.gz"
       "subprocess-check_output.patch")
b2sums=('4267c636a6482ad50d7ab9b6acf4250f0aaa080f143a9b934ae783eed8edaaa62b13733359e1aa3a4adc8f920902802628da15b26443359025f7ac661c6ce2e5'
        '118ab7f3be34fbfdc9dd99baa40f98e48f4aee310cce20e1696222a81a82a626859a8d1b526cf21fc02c84b8a0019d184c3c3e8b6937b3af52b551c92ef6d497')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < ../subprocess-check_output.patch
}

build() {
  cd "$_pkgname-$pkgver"
  sed -i -e 's!\(/usr/bin/\)env !&!' src/$_pkgname
}

package() {
  cd "$_pkgname-$pkgver"
  install -D -m 755 src/$_pkgname "$pkgdir"/usr/bin/btrfs-compress
  install -D -m 644 README.md "$pkgdir"/usr/share/doc/btrfs-compress/README.md
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licences/btrfs-compress/LICENSE
}

# vim:set ts=2 sw=2 et:
