# Maintainer: James An <james@jamesan.ca>
# Contributor: Jeff <jecxjo@sdf.lonestar.org>

pkgname=geeknote-git
_pkgname=${pkgname%-git}
pkgver=r254.8489a87
pkgrel=1
pkgdesc='Console client for Evernote.'
arch=('any')
url="http://www.geeknote.me"
license=('GPL')
depends=('python2-html2text'
         'python2-markdown2'
         'python2-sqlalchemy'
         'evernote-sdk-python')
makedepends=('git' 'python2-setuptools')
provides=($_pkgname=$pkgver)
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/VitaliyRodnenko/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $_pkgname
    python2 setup.py install --root="$pkgdir" --optimize=1
}
