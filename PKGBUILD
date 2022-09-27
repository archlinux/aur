# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor:  Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander Minges <alexander.minges@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Andrzej Wąsowski <wasowski@data.pl>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
# Contributor: Vo Van Hong Ngoc <vhngoc@ubuntu-vn.org>

pkgname=rawdog
pkgver=3.0.rc0
pkgrel=1
pkgdesc='RSS Aggregator Without Delusions Of Grandeur'
arch=('any')
url='https://github.com/echarlie/rawdog-py3'
license=('GPL2')
depends=('python' 'python-feedparser')
makedepends=('git' 'python-setuptools')
optdepends=('python-tidylib')
_commit='6ce74c30309e4353ec86e7a62fceddbd979f04f3'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # FTBFS:
  #   fix missing comma in setup.py
  #   fix sys version check
  # https://github.com/echarlie/rawdog-py3/pull/1
  sed -e 's/\(\turl.*$\)/\1,/' -i setup.py
  sed -e 's/sys.version_info !=/sys.version_info <=/' -i setup.py
}

build() {
  cd "$pkgname"

  python setup.py build
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1
}
