# Maintainer: Joshua Haase <hahj87@gmail.com>
# Contributor: Matjaž Mozetič (https://github.com/sysadminmatmoz)
# Contributor: Vincent Demeester (vincent@sbr.pm)
# Contributor: Nicolas Pouillard (http://nicolaspouillard.fr)
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Andreas Hilboll <andreas@hilboll.de>
# Contributor: kljohann@gmail.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=myrepos-git
pkgver=1.20160122
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc="Multiple Repository management tool"
arch=('any')
depends=('perl')
makedepends=('git')
optdepends=('bzr: support for bzr repositories'
            'cvs: support for cvs repositories'
            'darcs: support for darcs repositories'
            'git-annex: support for git-annex clones'
            'gitk: support for visualizing git repository history'
            'git: support for git repositories'
            'mercurial: support for mercurial repositories'
            'perl-html-parser: support for webcheckout'
            'perl-libwww: support for webcheckout'
            'perl-uri: support for webcheckout heuristically guessing partial URLs'
            'repo: support for repo repositories'
            'svn: support for subversion repositories'
            'unison: support for unison as a vcs'
            'vcsh: support for vcsh')
url="http://myrepos.branchable.com"
license=('GPL2')
source=("${pkgname%-git}::git+https://github.com/joeyh/${pkgname%-git}")
sha256sums=('SKIP')
provides=('mr' 'myrepos' 'webcheckout')
conflicts=('mr' 'myrepos' 'webcheckout')

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -D README -t "$pkgdir/usr/share/doc/mr/"
  install -D mrconfig "$pkgdir/usr/share/doc/mr/"mrconfig.example
  install -D mrconfig.complex "$pkgdir/usr/share/doc/mr/"mrconfig.complex.example

}
