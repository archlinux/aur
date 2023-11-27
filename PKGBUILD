# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname='XKCD-password-generator'
pkgver=1.19.8
pkgrel=1
pkgdesc='Generate secure passphares inspired by XKCD'
arch=('any')
url='https://github.com/redacted/XKCD-password-generator'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
optdepends=('cracklib: alternative wordlist'
    'words: alternative wordlist')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('8e0b4d48edb9d3ec70fd119849e160aea0c52f765e38391883c6a02257367ae6')

build() {
    cd "$_pkgname-$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pkgname-$pkgname-$pkgver"
    nosetests tests
}

package() {
    cd "$_pkgname-$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -m644 -D LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 -D xkcdpass.1 "$pkgdir/usr/share/man/man1/xkcdpass.1"
}
