# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=hfd-git
pkgver=r30.258f20e
pkgrel=1
pkgdesc='CLI-Tool for download Huggingface models and datasets with aria2/wget+git'
arch=('any')
url='https://gist.github.com/padeoe/697678ab8e528b85a2a7bddafea1fa4f'
license=('unknown')
depends=('bash' 'git' 'git-lfs')
optdepends=('aria2: Optional download tool for hfd. At least one optional download tool must be installed.'
            'wget: Optional download tool for hfd. At least one optional download tool must be installed.')
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
