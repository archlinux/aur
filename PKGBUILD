# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: kpcyrd <git@rxv.cc>

pkgbase=reprotest
pkgname=('reprotest')
pkgver=0.7.4
pkgrel=2
pkgdesc="Run a process twice and check the output for reproducibility"
arch=('any')
license=('GPL2' 'GPL3')
url="https://anonscm.debian.org/cgit/reproducible/reprotest.git/"
provides=("reprotest=$pkgver")
depends=('python' 'python-rstr' 'diffoscope' 'fakeroot' 'python-distro')
optdepends=('disorderfs>=0.5.2' 'python-progressbar>=3.34.3-1')
makedepends=('python' 'python-setuptools')
source=("http://reproducible.alioth.debian.org/releases/reprotest/${pkgname}_${pkgver}.tar.xz"
        "uname-m.patch")
sha512sums=('bf7921a99f05539e310b8d41efc0b23f9388947392710f1c55497e467ed75f07ffc611f79eabdb2e7091a7f917aacd09eaca229bfb5d68eaae726fde15444cc4'
            'a656f5dbcbd19296823cd15f27247e999ce0e4a24d0b4e41ed8b6263abb3261a6e82a194bfb6b2b92e4457affb4198fbee1caa899f8d8359cef069fa021767fd')

prepare() {
  cd "$srcdir/reprotest"
  patch -Np1 -i "${srcdir}/uname-m.patch"
}

build() {
  cd "$srcdir/reprotest"
  python setup.py build
}

package() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/reprotest"
  python setup.py install --root="$pkgdir" --optimize=1
}
