_pkgname=mc-vector
_pkgver=0.0.5
_commit=67a650b
pkgrel=1
pkgname=${_pkgname}-git
pkgver=${_pkgver}.g${_commit}
pkgdesc="Vector-06c floppy and hard disk image reader/writer for Midnight Commander"
arch=('any')
url="https://github.com/ekundo/mc"
license=('MIT')
depends=('mc' 'cpmtools' 'gawk')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
install="$pkgname.install"
source=("$pkgname::git+$url.git#commit=$_commit"
        "$_pkgname.hook"
        "$_pkgname-register-ext")
sha256sums=('SKIP'
            '5babc6bf076dd846bc3b484d6538372fc30a42dd51f4547f488bc553affaecb0'
            'ca8e9eae5f55c68cd9ff0aa5527bd31c1a3c6ad1ab2d00c88b2dca71b316a947')

package() {
  install -Dm755 "$pkgname/packages/mc-fdd/ufdd" "$pkgdir/usr/lib/mc/extfs.d/ufdd"
  install -Dm755 "$pkgname/packages/mc-hdd/uhdd" "$pkgdir/usr/lib/mc/extfs.d/uhdd"

  install -Dm755 "$_pkgname-register-ext" "$pkgdir/usr/share/$_pkgname/register-ext"
  install -Dm644 "$_pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$_pkgname.hook"

  install -dm755 "$pkgdir/usr/share/$_pkgname"
  printf 'diskdef v06\n  seclen 1024\n  tracks 164\n  sectrk 5\n  blocksize 2048\n  maxdir 128\n  boottrk 8\nend\n' \
    > "$pkgdir/usr/share/$_pkgname/diskdefs"

  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
