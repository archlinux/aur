# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=aurutils
pkgver=1.5.3
pkgrel=8
pkgdesc='helper tools for the arch user repository'
arch=('any')
url='https://github.com/AladW/aurutils'
license=('custom:ISC')
depends=('pacman>=5' 'git' 'jq' 'pacutils>=0.4')
makedepends=('git')
optdepends=('devtools: systemd-nspawn support'
            'vifm: build file interaction'
            'aria2: threaded downloads'
            'parallel: threaded downloads'
            'expac: aursift script'
            'repose: repo-add alternative')
_backports=('0001-aurbuild-backport-fix-for-236.patch'
            '0002-aursync-make-L-optional-281.patch'
            '0003-aurbuild-update-default-options.patch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc"
        "${_backports[@]}")
sha256sums=('a09088a460e352179dbf799d915e866af47aa280474a9c943f8e6885490734c5'
            'SKIP'
            'e4076af43608a00e47379232b4d42412b5956d96c73f66ecb2cfd62d8a2eba86'
            '6a28f1e1c98a69a236409ed659f0a699c89bb16748d364be2ba0841041cd015c'
            '84976fe128a6ea5b7bb185d63fe447a340404a9d63700020158202e6e8006b49')
# Alad Wenter <alad@mailbox.org>
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A')

prepare() {
    cd "$pkgname-$pkgver"
    for p in "${_backports[@]}"; do
        patch -p1 < "$srcdir/$p"
    done
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
