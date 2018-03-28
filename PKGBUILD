# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=aurutils
pkgver=1.5.3
pkgrel=10
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
            '0004-aurfetch-specify-git-work-tree-git-dir-274.patch'
	    '0005-specify-absolute-paths-for-GIT_DIR-GIT_WORK_TREE.patch'
	    '0006-aurfetch-aursearch-use-aria2-no-conf.patch'
	    '0007-aurchain-do-not-sort-results-when-appending.patch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc"
        "${_backports[@]}")
sha256sums=('a09088a460e352179dbf799d915e866af47aa280474a9c943f8e6885490734c5'
            'SKIP'
            '8bf1fe675284a8e91aa37bdbf035c0158f910446fdd10d21a705e89ff711c883'
            '75326f1f932b545754eb05ef62ad637874367d276ee584ff9544f0c0178e39b8'
            'bb03ef84bd3e7b28af9d2a829a61869c4845bdce65c897d267e691091033fe8a'
            '40efaedd46cb98e0af0faf8cd61dc36eaa2638cf429d280beaf5c37f09a4369b'
            '2fc7599245c53cad4b3b404a9ecf0ef122cf6be66d18a156e83ebfd1923b5359'
            '8f4c9ea372827db3a4d4aa8e67e4fd962384197fc1684ba50e4f739d2917402f'
            '1cb14e6605e38a1bc127d7ea576a02dfbc2d3c0e009597980fe4040a65b347f2')
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
