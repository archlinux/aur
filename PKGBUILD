# Maintainer: Daniel Wallace: <danielwallace at gtmanfred dot com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

pkgname=hub-git
_pkgname=hub
pkgver=2.2.0.27.g64187e3
epoch=1
pkgver(){
    cd $_pkgname
    git describe --tags | sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="hub introduces git to GitHub"
arch=('x86_64')
url="http://hub.github.com"
depends=('git')
makedepends=('go')
license=('MIT')
source=($_pkgname::git://github.com/github/hub.git)
md5sums=('SKIP')
conflicts=('hub' 'hub-rubygem-git')
provides=('hub')
replaces=('hub-rubygem-git')

build() {
    cd "$srcdir/$_pkgname"
    ./script/build
    gzip --best -c man/$_pkgname.1> $_pkgname.1.gz
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "etc/hub.bash_completion.sh" "$pkgdir/usr/share/bash-completion/completions/hub"
    install -Dm644 "etc/hub.zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hub"

    install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}

