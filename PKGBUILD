# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=pbincli
_name="PBinCLI"
pkgver=0.3.0
pkgrel=1
pkgdesc='A command line client for PrivateBin'
arch=('any')
url='https://github.com/r4sas/PBinCLI'
license=('MIT')
depends=('python'
         'python-base58'
         'python-pycryptodome'
         'python-requests'
         'python-sjcl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "requirements.txt"
        "LICENSE")
sha1sums=('844fd7b46f4f437f1ab4de62c4ea3c018b60bfc0'
          'c3409930f9cc1b2f86873d299f54a4ad818a86c1'
          '866615726030714e001269a8085114f070dbac05')
sha256sums=('261b05dfcd471675d6442fed8eb779a7f8c2817fe29b5204ff9fc8a03b47d089'
            'b9c0f5fe9a218463a4a1fe687efe7a351a6ffec083961a2dde007d0ded0e350f'
            'e0b9ef9ff5d625fc9eb0ca287dc5a8798bbc631b6818742b96b1f8c7b6b30c65')

build() {
  cd "$_name-$pkgver"
  cp ../requirements.txt .
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
