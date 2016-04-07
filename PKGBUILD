# Maintainer: Please see AUR package page for current maintainer contact information.

pkgname=btrfs-compress
# compress is too generic a name!!! Also the script is unmaintained upstream but still works.
_pkgname=compress
pkgver=20150322.r6
pkgrel=1
pkgdesc="btrfs tool that makes it possible to change +c flags recursively on existing files"
arch=('i686' 'x86_64')
url="https://github.com/benapetr/compress"
# asked for a clarification on licensing months ago but the author is blind or full of hubris.
# The script is too useful not to post it to AUR, though.
license=('custom:unkown') 
depends=('python')
source=("git+https://github.com/benapetr/$_pkgname.git#commit=881569b92ca76731f94906f101f18e49709b645a")
md5sums=('SKIP')

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
}

# vim:set ts=2 sw=2 et:
