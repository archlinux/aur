# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=hfd-git
pkgver=r42.dcc19a0
pkgrel=1
pkgdesc='CLI-Tool for download Huggingface models and datasets with curl/aria2/wget'
arch=('any')
url='https://gist.github.com/padeoe/697678ab8e528b85a2a7bddafea1fa4f'
license=('unknown')
depends=('bash' 'curl')
makedepends=('git')
optdepends=('aria2: default download tool (4 threads x 5 concurrent, use --tool wget to use wget instead)'
            'wget: alternative download tool (--tool wget)'
            'jq: faster JSON parsing for file-list retrieval (fallback to grep/awk)')
provides=('hfd')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  install -Dm755 "$srcdir/$pkgname/hfd.sh" "$pkgdir/usr/bin/hfd"
}
