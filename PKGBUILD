# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.5.1
pkgrel=3
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
conflicts=(bugwarrior-git)
url="https://bugwarrior.readthedocs.io"
license=('GPL3')
depends=('python' 'python-setuptools'
         'python-requests' 'python-taskw'
         'python-dateutil' 'python-pytz'
         'python-six' 'python-jinja'
         'python-dogpile.cache' 'python-lockfile'
         'python-click' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ralphbean/bugwarrior/archive/$pkgver.tar.gz")
sha256sums=('f28b98be94e1c11ade5876c68daaa7a6f0a25b3d13c1cf8898da97e411ce63e8')

prepare(){
    cd "$srcdir/$pkgname-$pkgver"
    sed -i -e 's/!=0.16.0//g' setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
