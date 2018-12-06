pkgname=uberwriter
_pkgname=uberwriter
pkgver=2.1.4
pkgrel=1
pkgdesc='A distraction free Markdown editor for GNU/Linux made with GTK+'
arch=('any')
url='http://uberwriter.github.io/uberwriter/'
license=('GPL3')
depends=('gtk3' 'pandoc' 'python-gtkspellcheck')
makedepends=('python-setuptools')
optdepends=('texlive-core' 'otf-fira-mono: Recommended font')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/UberWriter/uberwriter.git#tag=v2.1.4')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

post_install() {
    /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
}
post_upgrade() {
    /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
}
post_remove() {
    /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
}

