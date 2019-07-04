# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-http3
_name=${pkgname#python-}
_py=py3
pkgver=0.6.6
pkgrel=1
pkgdesc="The next generation HTTP client for Python 3."
arch=('any')
url="https://www.encode.io/http3/"
license=('BSD')
depends=('python>=3.6.0'
         'python-certifi'
         'python-chardet>=3.0.0' 'python-chardet<4.0.0'
         'python-h11>=0.8.0'     'python-h11<0.9.0'
         'python-h2>=3.0.0'      'python-h2<4.0.0'
         'python-idna>=2.0.0'    'python-idna<3.0.0'
         'python-rfc3986>=1.0.0' 'python-rfc3986<2.0.0')
makedepends=('python-pip' 'curl')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("28da5a7737cd6f4fe5e97e7b7e02d65e2c9d19ae11bc3534e2bfa70f331002d9")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz || exit
    curl "https://raw.githubusercontent.com/encode/http3/master/LICENSE.md" -o LICENSE.txt || exit
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt" || exit
    rm -f "$pkgdir/usr/LICENSE.md"
}
