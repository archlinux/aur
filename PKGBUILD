# Maintainer: Margret Riegert <margret at eowyn dot net>

pkgname=crystal-nightly
pkgver=20240218
pkgrel=1

pkgdesc="The Crystal Programming Language, nightly binaries"
arch=('x86_64')
url="http://crystal-lang.org"
license=('Apache')

makedepends=('tar')
depends=('gc' 'pcre2' 'libevent')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git' 'inetutils')
optdepends=('shards: To make the crystal deps command work'
            'libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')

conflicts=('crystal' 'shards')
provides=('crystal' 'shards')

source=("$pkgname-$pkgver.tar.gz::https://artifacts.crystal-lang.org/dist/crystal-nightly-linux-$CARCH.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('9fcb89d8df88a038ff6b47bcbfab44188830b8eb82707f1f656ecd67015b8ad3')

pkgver() {
  date '+%Y%m%d'
}

prepare() {
  if [ -d "$pkgname-$pkgver" ]; then
    rm -rf "$pkgname-$pkgver"
  fi

  mkdir "$pkgname-$pkgver"
  tar -zxvf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver" --strip-components=1
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/crystal" "$pkgdir/usr/bin/crystal"
  install -Dm755 "bin/shards" "$pkgdir/usr/bin/shards"

  cp -r "lib" "$pkgdir/usr/lib"
  cp -r "share" "$pkgdir/usr/share"
}
