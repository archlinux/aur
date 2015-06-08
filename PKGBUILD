# Maintainer: Zack Gold <zg@mail.rit.edu>

pkgname=python2-boto-git
pkgver=2.31.1
pkgrel=1
pkgdesc='A Python package that provides interfaces to Amazon Web Services, includes everything from the boto git'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
makedepends=('git' 'python2-nose' 'python2-pip')
provides=('python2-boto')
conflicts=('python2-boto')
options=('!emptydirs')
source=('git://github.com/boto/boto.git')
md5sums=('SKIP')

pkgver () {
    cd boto
    # (last-tag).r(revisions-since).(latest-commit-hash)
    git describe | sed 's/-/.r/; s/-/./'
}

package() {
    cd boto
    python2 setup.py install --root="$pkgdir"/ --optimize=1

    # The package is MIT, this means you need to provide a copy
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
