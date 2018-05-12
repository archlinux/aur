# Contributor: Alexandre Jesus <adbjesus@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=soccer-cli-git
pkgname=('python2-soccer-cli-git' 'python-soccer-cli-git')
pkgver=20180512_r267.990bdfd
pkgrel=1
pkgdesc="Soccer for Hackers - a CLI for all the football scores."
arch=('any')
url="https://github.com/architv/soccer-cli"
license=('MIT')
makedepends=('git' 'python' 'python2')
provides=("${_pkgname}")
source=('git+https://github.com/architv/soccer-cli.git')
md5sums=('SKIP')
install="${pkgbase}.install"

pkgver() {
  cd ${pkgbase%-git}

  # Get the version number.
  printf "%s_r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase%-git}

  sed -i -e 's/requests==2/requests>=2/' setup.py
  cd ..
  cp -r ${pkgbase%-git} ${pkgbase%-git}2
  cp -r ${pkgbase%-git} ${pkgbase%-git}3
}

package_python2-soccer-cli-git() {
  depends=('python2-click' 'python2-requests')
  cd ${pkgbase%-git}2

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir"/usr/bin/soccer "$pkgdir"/usr/bin/soccer2
}

package_python-soccer-cli-git() {
  depends=('python-click' 'python-requests')
  cd ${pkgbase%-git}3

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir"/usr/bin/soccer "$pkgdir"/usr/bin/soccer3
}

