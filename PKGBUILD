# Maintainer: Please see AUR package page for current maintainer contact information.

pkgname=btrfs-compress
# compress is too generic a name!!! Also the script is unmaintained upstream but still works.
_pkgname=compress
pkgver=20190221.r12
pkgrel=1
pkgdesc="btrfs tool that makes it possible to change +c flags recursively on existing files"
arch=('i686' 'x86_64')
url="https://github.com/benapetr/compress"
license=('BSD') 
depends=('python')
makedepends=('git')
source=("git+https://github.com/benapetr/$_pkgname.git#commit=394be8f2a44b8587c7190decf4d758e15dfed9d7")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s" \
    "$(git log -1 --format="%cd" --date=short | sed 's/\-//g')" \
    "$(git rev-list --count HEAD)"
}

build() {
  cd "$_pkgname"
  sed -i -e 's!\(/usr/bin/\)env !&!' src/$_pkgname
}

package() {
  cd "$_pkgname"
  install -D -m 755 src/$_pkgname "$pkgdir"/usr/bin/btrfs-compress
  install -D -m 644 README.md "$pkgdir"/usr/share/doc/btrfs-compress/README.md
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licences/btrfs-compress/LICENSE
}

# vim:set ts=2 sw=2 et:
