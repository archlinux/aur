# Contributor: Alexandre Jesus <adbjesus@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=soccer-cli-git
_gitname=soccer-cli
epoch=1
pkgver=r306.04932b6
pkgrel=1
pkgdesc="Soccer for Hackers - a CLI for all the football scores."
arch=('any')
url="https://github.com/architv/soccer-cli"
license=('MIT')
makedepends=('git' 'python' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools')
source=(${_gitname}::git+${url})
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
  #cd ${pkgbase%-git}

 # sed -i -e 's/requests==2/requests>=2/' setup.py
  #cd ..
  #cp -r ${pkgbase%-git} ${pkgbase%-git}3
#}

build() {
cd "$_gitname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

