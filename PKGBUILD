# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname='XKCD-password-generator'
pkgver=1.19.3
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
sha256sums=('8ac1e1778c6c9bb1725816244695c79c622414f6937406be1eb10606de166340')

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
