# Do not edit PKGBUILD directly. Edit PKGBUILD.tpl and update the setup.json file

# Maintainer: madflow <madflow@web.de>
pkgname=shrr
pkgver=0.1.3_dev
pkgrel=1
pkgdesc="Share files via HTTP"
arch=('any')
url="https://gitlab.com/madflow/shrr"
license=(MIT)
depends=('python>=3.3' 'python-flask' 'python-netifaces' 'python-colorama' 'python-qrcode')
makedepends=('python-setuptools' 'python-pip' 'nodejs' 'yarn')
source=(https://gitlab.com/madflow/shrr/repository/52fb65d80110496a86512f0932818954f7bfe5d1/archive.tar.gz)
md5sums=(8b4065b281093068516cf87ec695d420)

build() {
  cd "$srcdir/$pkgname-52fb65d80110496a86512f0932818954f7bfe5d1-52fb65d80110496a86512f0932818954f7bfe5d1"
  python setup.py yarn install --dev --emoji
  python setup.py yarn run build:prod
}

package() {
  cd "$srcdir/$pkgname-52fb65d80110496a86512f0932818954f7bfe5d1-52fb65d80110496a86512f0932818954f7bfe5d1"
  python setup.py install --root="$pkgdir/" --optimize=1
}