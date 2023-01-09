# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-daemon
pkgver=2.3.0
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pagure.io/python-daemon'
license=('Apache')
depends=(
  'python2'
  'python2-lockfile'
  'python2-setuptools'
)
makedepends=(
  'python2-docutils'
  'python2-setuptools'
)
source=(
  # https://files.pythonhosted.org/packages/b2/fb/a280d65f81e9d69989c8d6c4e0bb18d7280cdcd6d406a2cc3f4eb47d4402/python-daemon-2.1.2.tar.gz
  # https://files.pythonhosted.org/packages/99/2a/75fe6aa7086e838570f29899f674e7896a42be26d9fff33f90d990e599d2/python-daemon-2.2.0.tar.gz
  # https://files.pythonhosted.org/packages/05/97/210f94322675c838319ffa8e505032373ff1f6a6219af8d16427e00b1051/python-daemon-2.2.4.tar.gz
  https://files.pythonhosted.org/packages/d6/2d/f5e9a44e76777ca5c20765d92eb2d2cb89b6cfa5e921c808fdd57c90cae7/python-daemon-2.3.0.tar.gz
  # https://files.pythonhosted.org/packages/d9/3c/727b06abb46fead341a2bdad04ba4a4db5395c44c45d8ba0aa82b517e462/python-daemon-2.3.2.tar.gz  # Not compatible with python2 anymore due to encoding issues.
  #testtools-2.5.0.patch
  #python310.patch
)
sha256sums=(
  # '261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73'
  # 'aca149ebf7e73f10cd554b2df5c95295d49add8666348eff6195053ec307728c'
  # '57c84f50a04d7825515e4dbf3a31c70cc44414394a71608dee6cfde469e81766'
  'bda993f1623b1197699716d68d983bb580043cf2b8a66a01274d9b8297b0aeaf'
  # '3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5'
  #'7f8dfbe9e01edcb19ebede5580d448a995b721ee3b56ca1d353f58c36416c980'
  #'1777e34936ed5d45001e9994f563fdf8c9e2045b667223f1eebf896031627ddc'
)

prepare() {
  cd python-daemon-$pkgver
  #patch -Np1 -i ../testtools-2.5.0.patch
  #patch -Np1 -i ../python310.patch

  # NOTE: twine is *not* required for building this package
  sed -e '/twine/d' -i setup.py
}

build() {
  cd python-daemon-$pkgver
  python2 ./setup.py build
}

package() {
  cd python-daemon-$pkgver
  python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
