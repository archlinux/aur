# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=feed2toot
pkgname=python-feed2toot-git
pkgver=0.17.r3.g89518b2
pkgrel=2
pkgdesc="Feed2toot automatically parses rss feeds, identifies new posts and posts them on the Mastodon social network."
arch=('any')
url="https://gitlab.com/chaica/feed2toot"
license=('GPL3')
depends=('python-feedparser' 'python-mastodon' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=("git+https://gitlab.com/chaica/feed2toot.git"
	safeconfigparse_correction.patch)
md5sums=('SKIP'
	 '9f4e1f3facbcb285078258b122e2b389')
_gitname=$_pkgname


pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitname"
	patch -Np0 -i ../safeconfigparse_correction.patch
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
