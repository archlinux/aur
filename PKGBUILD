# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.6.0
pkgrel=1
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
sha256sums=('92e417f956e6f9855ed7bb1197d10931175083086f2244fbf4aaeabdadfbdd82')

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
