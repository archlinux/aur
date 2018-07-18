# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: bb010g <bb010g@bb010g.com>
pkgname=mastodon-backup-git
pkgver=r146.afc28dd
pkgrel=1
pkgdesc="Archive your statuses, favorites and media using the Mastodon API (Git version)"
arch=(any)
url="https://github.com/ponylang/mkdocs-theme"
license=('GPL3')
depends=(python python-{html2text,mastodon,progress})
makedepends=(git python-setuptools)
source=("git+https://github.com/kensanata/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
