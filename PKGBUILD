# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-freezegun
pkgver=1.2.2
# https://github.com/spulec/freezegun/issues/468
_commit=9d5ea73e0464e5856bc7ab75cc45b35d7eb88c32
pkgrel=1
pkgdesc="Let your Python tests travel through time"
arch=('any')
license=('Apache')
url="https://github.com/spulec/freezegun"
depends=('python38-dateutil')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("$pkgname-$_commit.tar.gz::https://github.com/spulec/freezegun/archive/$_commit.tar.gz"
        $pkgname-python3.8.patch::https://github.com/spulec/freezegun/pull/397.patch)
sha512sums=('7c7d5aa2ddba699d0532f4ae173446b982da0dbb5a05517d1855efd6afc3eafa68b24b5f63ea39852a665bddf6baf98b97d14617dcefe72acfe96a1fd8dc22e8'
            '7448b5e1834d603eb4d0a05b929cbd297844eac2bae9306e94545c97a2cbf87a27618fadda573dafc65427e932bca46f7669f4f4b7a89fabe3fc5ba153311e2e')

prepare() {
  cd freezegun-$_commit
  patch -p1 -i ../$pkgname-python3.8.patch
}

build() {
  cd freezegun-$_commit
  python3.8 setup.py build
}

check() {
  cd freezegun-$_commit
  pytest
}

package() {
  cd freezegun-$_commit
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
