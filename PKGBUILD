pkgname=dosierskanilo-git
pkgver=0
pkgrel=1
pkgdesc='Development version of the DosierSkanilo scanner'
arch=('x86_64')
url='https://github.com/cschlote/DosierSkanilo'
license=('custom:CC-BY-NC-SA-4.0')
depends=('mediainfo' 'file' 'unzip' 'tar' 'unrar' 'p7zip')
makedepends=('ldc' 'dub' 'git')
provides=('dosierskanilo')
conflicts=('dosierskanilo')
source=('git+https://github.com/cschlote/DosierSkanilo.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/DosierSkanilo"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/DosierSkanilo"
  DC=ldc2 dub build --build=release --compiler=ldc2 --config=cli
}

package() {
  cd "$srcdir/DosierSkanilo"
  install -Dm755 build/bin/dosierskanilo "$pkgdir/usr/bin/dosierskanilo"
}
