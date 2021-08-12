# Maintainer: Otakar Jasek <jasek dot ota at gmail dot com>

pkgname=python-remote_ikernel
_name=${pkgname#python-}
pkgver=0.4.6
pkgrel=3
pkgdesc="Remote kernel setup for Jupyter"
arch=(any)
url="https://github.com/cfriedline/remote_ikernel"
license=('BSD')
depends=('python-pexpect' 'jupyter-notebook')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
'host.patch' 'usrfix.patch')
sha256sums=('740b80a57fa1af40cadef541c5a4eb293675b504092ecf00c57dd2f0011bd840'
            'bf209f55f6dea633e09a7f809ae9e1aa7c0d9fdfd0d026d8cf900b7a6d8cf6af'
            'f8c57fc530c8ba51f8baa27bb3c4e9e1ad9bc84cf841a5ebf04ffed58e58ceb2')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -Np1 < ../host.patch
  patch -Np1 < ../usrfix.patch
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
