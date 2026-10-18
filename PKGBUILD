pkgname=dosierskanilo
pkgver=26.11.2
pkgrel=1
pkgdesc='Blob-centric media and archive file scanner'
arch=('x86_64')
url='https://github.com/cschlote/DosierSkanilo'
license=('custom:CC-BY-NC-SA-4.0')
depends=('mediainfo' 'file' 'unzip' 'tar' 'unrar' 'p7zip')
makedepends=('ldc' 'dub' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('42da120431ea584fafd15d8b43755a1b877ea64f1366f824abd485aa779ac90c')

build() {
  cd "$srcdir/DosierSkanilo-$pkgver"
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git init --quiet
    git add .
    git -c user.name='Arch Linux package' -c user.email='noreply@archlinux.org' commit --quiet -m "Import release source"
    git tag "v$pkgver"
  fi
  DC=ldc2 dub build --build=release --compiler=ldc2 --config=cli
}

package() {
  cd "$srcdir/DosierSkanilo-$pkgver"
  install -Dm755 build/bin/dosierskanilo "$pkgdir/usr/bin/dosierskanilo"
}
