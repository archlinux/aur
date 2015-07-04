# Maintainer: William Osler <{firstname}@{lastname}s.us>
pkgname=willie
pkgver=5.3.0
pkgrel=1
pkgdesc="A modular IRC bot written in Python."
arch=('any')
url="http://willie.dftba.net/"
license=('custom:Eiffel Forum License, version 2')
depends=('python')
makedepends=('python-sphinx' 'python-setuptools')
optdepends=('mysql-python: bucket module'
    'python-feedparser: nws and rss modules'
    'python-pytz: remind module'
    'python-lxml: xkcd module'
    'python-pyenchant: spellchek module'
    'python-praw-git: reddit module'
    'python-pygeoip: geoip module')
source=("https://github.com/embolalia/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b63290fb02b72e190a887ca349aed5db')
install='willie.install'

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
    make -C docs man
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 contrib/willie.cfg "$pkgdir/etc/willie.cfg"
    install -Dm644 contrib/willie.service "$pkgdir/usr/lib/systemd/system/willie.service"
    install -Dm644 contrib/willie.conf "$pkgdir/usr/lib/tmpfiles.d/willie.conf"
    install -Dm644 docs/build/man/willie.1 "$pkgdir/usr/share/man/man1/willie.1"
}
