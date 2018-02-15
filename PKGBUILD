# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=aurutils
pkgver=1.5.3
pkgrel=9
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
            '0003-aurbuild-update-default-options.patch'
            '0004-aurfetch-specify-git-work-tree-git-dir-274.patch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc"
        "${_backports[@]}")
sha256sums=('a09088a460e352179dbf799d915e866af47aa280474a9c943f8e6885490734c5'
            'SKIP'
            'ea5e34adeb4c8ead68bd8aa934b5b39ad30f4ca05262b6b99a305e2eaf2ee577'
            '849adcbb1c9510b7bc87a85b8e1589fa972e2aeca0efff583eb22f65b2f28fd3'
            '156cb3becc09e2042780dec2f06d91a28f32c1d898e94915d1753e38f056a59a'
            '3372a7342606924685c80c8583d31cf202ece24d1a3aa86c709c650ac3ddc930')
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
