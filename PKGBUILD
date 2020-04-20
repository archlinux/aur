# Maintainer: Mubashshir <ahmubashshir@gmail.com>

pkgname=trakt-scrobbler
pkgver=1.0.0b4
pkgrel=1
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    $(curl -s https://pypi.org/pypi/trakt-scrobbler/$pkgver/json|jq -r '.info|.requires_python, .requires_dist[]'|grep -v win32|sed -E 's/^>=([[:digit:].-]+),<([[:digit:].-]+)$/python>=\1\npython<\2/;s/^([[:alnum:]]+) \(>=([[:alnum:].-]+),<([[:alnum:].-]+)\)$/python-\1>=\2\npython-\1<\3/')
)
makedepends=(python-setuptools jq curl grep sed)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=(1c450bf8b6f183a7ddf8bad1540e32969cce8518bf84b9fe16a2456f260ef116)
build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}
package()
{
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
