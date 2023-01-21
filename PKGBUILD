# Contributor: Alexandre Jesus <adbjesus@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=soccer-cli-git
epoch=1
pkgver=20211129_r306.04932b6
pkgrel=1
pkgdesc="Soccer for Hackers - a CLI for all the football scores."
arch=('any')
url="https://github.com/architv/soccer-cli"
license=('MIT')
makedepends=('git' 'python' 'python2')
source=('git+https://github.com/architv/soccer-cli.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}

  # Get the version number.
  printf "%s_r%s.%s" "$(git log -1 --format="%cd" --date=short|tr -d - )" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase%-git}

  sed -i -e 's/requests==2/requests>=2/' setup.py
  cd ..
  cp -r ${pkgbase%-git} ${pkgbase%-git}3
}

package_python-soccer-cli-git() {
  depends=('python-click' 'python-requests')
  provides=('python-soccer-cli')
  cd ${pkgbase%-git}3

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir"/usr/bin/soccer "$pkgdir"/usr/bin/soccer3
}

