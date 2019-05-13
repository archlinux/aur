pkgname=totp-git
pkgver=r15.ba17832
pkgrel=1
pkgdesc="command line TOTP generator"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/TestudoAquatilis/totp"
license=('GPL')
depends=('python' 'python-onetimepass')
makedepends=('git')
optdepends=()
source=("$pkgname::git+https://github.com/TestudoAquatilis/totp")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
        install -D $srcdir/$pkgname/totp $pkgdir/usr/bin/totp
        install -m 644 -D $srcdir/$pkgname/zsh/site-functions/_totp $pkgdir/usr/share/zsh/site-functions/_totp
}
