# Maintainer      : Yuu $(echo \<yuu-tutamail+com\>|sed s/\+/./g\;s/\-/@/)

_pkgname=pylivestream
pkgname=$_pkgname-git
pkgver=1.11.1.r0.g6b0d23e
pkgrel=1
pkgdesc="Python FFmpeg-based live streaming to YouTube, Facebook, Periscope, Twitch, etc"
arch=('any')
url=https://github.com/scivision/$_pkgname
license=('AGPL3')
depends=('ffmpeg>=3.0' 'python>=3.6' 'python-setuptools')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

# Git, un-annotated tags available.
# Use the most recent un-annotated tag reachable from the last commit.
pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    python setup.py install --root="$pkgdir" --optimize=1
}
