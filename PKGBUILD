# Maintainer: Wouter de Vries <wouter@wbdv.nl>
pkgname=python-clickhouse-cli-git
_pkgname=clickhouse-cli
pkgver=r115.e031051
pkgrel=3
pkgdesc="Third-party client for the Clickhouse DBMS server"
arch=(any)
url="https://github.com/hatarist/clickhouse-cli"
license=('MIT')
depends=('python' 'python-sqlparse' 'python-pygments' 'python-prompt_toolkit1' 'python-click')
provides=('clickhouse-cli')
options=(!emptydirs)
source=('clickhouse-cli::git+https://github.com/hatarist/clickhouse-cli.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  find ./ -type f -exec sed -i -e 's/prompt_toolkit/prompt_toolkit1/g' {} \;
  find ./ -type f -exec sed -i -e 's/prompt-toolkit/prompt-toolkit1/g' {} \;
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
