# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=evil-winrm-py
pkgname="$_name-git"
pkgver=1.7.0.r1.geb60dd4
pkgrel=1
pkgdesc="evil-winrm rewrite in Python"
arch=('any')
url="https://github.com/adityatelange/$_name"
license=('MIT')
depends=(
  'python>=3.10'
  'python-prompt_toolkit>=3.0.53'
  'python-tqdm>=4.70.1'
  # AUR
  'python-pypsrp>=0.8.1'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-wheel'
  'python-installer'
  'python-build'
)
optdepends=(
  'python-krb5: Kerberos support'
  'python-gssapi: Kerberos support'
  'python-mcp>=2.2.0: MCP server'
)
provides=("$_name=$pkgver")
conflicts=("$_name")
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C "$_name" clean -dfx
}

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
