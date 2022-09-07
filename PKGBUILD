# Contributor: Jesper Jensen <jesper@slashwin.dk>
pkgname=python-borgmatic-git
pkgver=1.7.1.r5.g9e64d84
pkgrel=1
pkgdesc="a simple Python wrapper script for the Borg backup software"
arch=('any')
url="https://github.com/witten/borgmatic.git"
license=('GPL3')
depends=('python-ruamel-yaml' 'python-requests' 'python-jsonschema' 'python-colorama' 'borg')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-flexmock')
provides=('borgmatic')
conflicts=('borgmatic')
options=(!emptydirs)
source=('git+https://github.com/witten/borgmatic.git')
md5sums=('SKIP')

pkgver() {
  cd "borgmatic"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/borgmatic"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system sample/systemd/*
  install -d "$pkgdir"/usr/share/bash-completion/completions
}

check() {
  cd "$srcdir/borgmatic"
  python setup.py test
}
