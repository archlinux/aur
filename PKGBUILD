# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgbasename=litecli
pkgname=litecli-git
pkgver=v1.9.0.r20.ge95c17f
pkgrel=1
pkgdesc="A command-line client for SQLite databases that has auto-completion "\
"and syntax highlighting."
url="https://github.com/dbcli/litecli"
arch=(any)
license=('BSD')
depends=(
  'python'
  'python-click'
  'python-pygments'
  'python-prompt_toolkit'
  'python-sqlparse'
  'python-configobj'
  'python-cli_helpers'
)
makedepends=('python-distribute')
source=("git+https://github.com/dbcli/litecli.git")
md5sums=('SKIP')
provides=('litecli')
conflicts=('litecli')

pkgver() {
    cd "$srcdir/litecli"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null |
            sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" \
                "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $srcdir/litecli
    python setup.py install --root=$pkgdir/ --optimize=1
    install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
