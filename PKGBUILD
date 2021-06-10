# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Joshua Haase <hahj87@gmail.com>
# Contributor: Matjaž Mozetič (https://github.com/sysadminmatmoz)
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Nicolas Pouillard (http://nicolaspouillard.fr)
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Andreas Hilboll <andreas@hilboll.de>
# Contributor: <kljohann@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=myrepos-git
pkgver=1.20180726.r101.ge58d3b8
pkgrel=2
pkgdesc='Multiple Repository management tool'
arch=(any)
url='https://myrepos.branchable.com/'
license=(GPL2)
depends=(perl)
makedepends=(git)
optdepends=('bzr: support for bzr repositories'
            'cvs: support for cvs repositories'
            'darcs: support for darcs repositories'
            'git-annex: support for git-annex clones'
            'git: support for git repositories'
            'mercurial: support for mercurial repositories'
            'perl-html-parser: support for webcheckout'
            'perl-libwww: support for webcheckout'
            'perl-uri: support for webcheckout heuristically guessing partial URLs'
            'repo: support for repo repositories'
            'svn: support for subversion repositories'
            'unison: support for unison as a vcs'
            'vcsh: support for vcsh')
provides=(mr "myrepos=$pkgver" webcheckout)
conflicts=(mr myrepos webcheckout)
source=("$pkgname::${url/#https/git}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match='1.20*' |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make
}

check() {
    cd "$pkgname"
    make test
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README
}
