# Maintainer: Terunori Togo <terut.dev+github at gmail dot com>
pkgname=heroku
pkgver=5.7.1.c574890
pkgrel=1
pkgdesc="The next generation Go/Node-based Heroku CLI"
arch=("x86_64")
url="https://cli.heroku.com"
license=('MIT')
depends=('python')
makedepends=()
optdepends=('git: deployment support'
            'nodejs: cli plugins support'
            'npm: cli plugins support')
install="heroku.install"
source=("heroku.tar.gz::https://cli-assets.heroku.com/branches/stable/heroku-linux-amd64.tar.gz"
        "https://raw.githubusercontent.com/heroku/cli/master/LICENSE")
md5sums=('SKIP'
         '29da5ffd8cf020c01dcf968b867f7067')

pkgver() {
  cd "$srcdir/$pkgname"
  bin/heroku --version | sed -e 's/^.*\/\(.*\)\s(.*$/\1/g' -e 's/-/./g'
}

prepare() {
  cp "$srcdir"/LICENSE "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir"/usr/{lib,bin}

  cp -r "$srcdir/$pkgname" "$pkgdir"/usr/lib/
  install -Dm755 bin/heroku "$pkgdir"/usr/bin/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
