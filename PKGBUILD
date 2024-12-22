# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=barpyrus-git
_pkgname=${pkgname%-git}
pkgver=r118.671eb8d
pkgrel=1
pkgdesc="A python wrapper for lemonbar/conky"
arch=(any)
url="https://github.com/t-wissmann/barpyrus"
license=('BSD')
depends=('python' 'python-setuptools' 'lemonbar')
optdepends=(
  'conky: To use the conky widget'
  'siji-git: Default symbol font'
  'herbstluftwm: Default WM integration'
  'python-pytz: To use `tz_name` for `widgets.DateTime`'
  'python-xlib: To use the trayer integration'
  'trayer: To use the trayer integration'
  'playerctl: To use the playerctl integration'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/t-wissmann/barpyrus.git")
sha1sums=('SKIP')

prepare() {
  # https://github.com/pypa/setuptools/issues/1347
  git -C "$_pkgname" clean -dfx
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
