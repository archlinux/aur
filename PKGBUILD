# AUR Maintainer: Modelmat <modelmat@outlook.com.au>
# Repository Owner: Mario Apra <mariotapra@gmail.com>
# Contributor: Aanok <fabrizio07@gmail.com>

pkgname=onedrive-client-git
_pkgname=onedriveClient
pkgver=r270.be86e8b
pkgrel=1
pkgdesc="A Microsoft OneDrive and OneDrive for Business client for Linux, written in Python3."
url="https://github.com/derrix060/onedriveClient"
license=('MIT')
arch=('any')
replaces=('onedriveclient-git')
depends=(
    'python-arrow'
    'python-asn1crypto'
    'python-bidict'
    'python-certifi'
    'python-cffi'
    'python-chardet'
    'python-click'
    'python-colorama'
    'python-cryptography'
    'python-daemonocle'
    'python-idna'
    'python-inotify-simple'
    'python-keyring'
    'onedrive-sdk-python-git'
    'python-psutil'
    'python-pycparser'
    'python-dateutil'
    'python-pyaml'
    'python-requests'
    'python-secretstorage'
    'python-send2trash'
    'python-six'
    'python-tabulate'
    'python-urllib3'
    'python-zgitignore'
    'python-keyrings-alt'
    'inotify-tools'
    'ngrok'
    )
       
makedepends=('git')
source=('git+https://github.com/derrix060/onedriveClient'
        'onedriveClient.service')
sha256sums=('SKIP'
            '28466f805eca825145be503643d801273e8d00103b747fcd649b05dd04f6245e')
 
prepare() {
    sed -i 's/==/>=/' "$srcdir/$_pkgname/requirements.txt"
}
 
check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
}
 
build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}
 
package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    python setup.py clean
    install -Dm755 ../onedriveClient.service "$pkgdir/usr/lib/systemd/user/onedriveClient.service"
}