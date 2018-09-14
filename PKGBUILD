# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nextcloud-app-markdown
pkgver=2.0.4
pkgrel=3
pkgdesc="Extends the Nextcloud text editor with a live preview for markdown files"
arch=('any')
url="https://github.com/icewind1991/files_markdown"
license=('AGPL')
depends=('nextcloud')
makedepends=('npm' 'rsync')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('ea08aed10df31c75755262b55e1606ad210ba12f4e6d6375316ca268ee416ac0')

prepare() {
  # Nextcloud build system requires unversioned top directories
  mv files_markdown{-$pkgver,}

  cd files_markdown
}

build() {
  cd files_markdown

  # released version does not pass type checking in TypeScript...
  make || true
  make appstore
}

package() {
  install -Ddm755 "$pkgdir"/usr/share/webapps/nextcloud/apps/
  cp -dr --no-preserve=ownership files_markdown/build/artifacts/sign/files_markdown \
    "$pkgdir"/usr/share/webapps/nextcloud/apps/files_markdown
}
