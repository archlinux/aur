# AUR Maintainer: Modelmat <modelmat@outlook.com.au>
# Repository Owner: Mario Apra <mariotapra@gmail.com>
# Contributor: Modelmat <modelmat@outlook.com.au>

pkgname=onedriveclient-git
_pkgname=onedriveClient
pkgver=2018.10.1.e1a330c
pkgrel=1
pkgdesc="A Microsoft OneDrive and OneDrive for Business client for Linux, written in Python3."
url="https://github.com/derrix060/onedriveClient"
license=('MIT')
arch=('any')
provides=('onedrived')
depends=('inotify-tools'
		'python-pip')
		
makedepends=('git')
source=('git+https://github.com/derrix060/onedriveClient'
        'onedriveClient.service')
sha256sums=('SKIP'
            '7bc185193041ed322fc179e7ec986575c14cfa218a2bdd4f8dc06983e7456024')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python -m pip install -r requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
  python setup.py clean
  install -Dm755 ../onedriveClient.service \
    "$pkgdir/usr/lib/systemd/user/onedriveClient.service"
}
