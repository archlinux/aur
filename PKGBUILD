# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=arch-wiki-docs-ja
_pkgname=arch-wiki-docs
pkgdesc="Pages from Arch Wiki jp optimized for offline browsing"
pkgver=20210826
_commit=b06d5b6e6ab0c95cd3e6dc8ba02b9b2a85bee34d
pkgrel=1
arch=('any')
url="https://github.com/lahwaacz/arch-wiki-docs"
license=('FDL')
options=('!strip')
makedepends=('git' 'python' 'python-simplemediawiki' 'python-lxml' 'python-cssselect' 'python-requests')
source=("git://github.com/lahwaacz/arch-wiki-docs.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  date "+%Y%m%d"
}

prepare() {
  cd "$_pkgname"
  patch -Np1 < ../../archwiki-jp.patch
  LANG=en_US.UTF-8 python arch-wiki-docs.py --output-directory "$srcdir/build_wiki" --clean --safe-filenames
}

package() {
  install -dm755 "$pkgdir/usr/share/doc/arch-wiki-jp/html"
  cp -r "$srcdir"/build_wiki/* "$pkgdir/usr/share/doc/arch-wiki-jp/html/"
}
