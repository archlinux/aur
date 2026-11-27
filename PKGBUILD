# Maintainer: Renard
pkgname=flashkit-md
pkgver=0.1.0.r5.g3aa95b9
pkgrel=1
pkgdesc='Read, write, and inspect Mega Drive / 32X cartridges with FlashKit MD'
arch=('any')
url='https://github.com/MairusuPawa/flashkit-md-for-linux'
license=('GPL-3.0-or-later')
depends=('python' 'python-pyserial')
makedepends=('git')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  local site_packages
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  install -Dm755 flashkit-md.py "$pkgdir/usr/bin/flashkit-md"
  install -Dm644 flashkit_md_backend.py \
    "$pkgdir$site_packages/flashkit_md_backend.py"
  install -Dm644 man/flashkit-md.1 \
    "$pkgdir/usr/share/man/man1/flashkit-md.1"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
