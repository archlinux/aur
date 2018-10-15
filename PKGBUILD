# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=uberwriter-git
pkgver=2.1.2.r0.g2b25681
pkgrel=1
pkgdesc='A distraction free Markdown editor for GNU/Linux made with GTK+'
arch=(any)
url="http://uberwriter.github.io/uberwriter/"
license=(GPL3)
depends=(gtk3
         pandoc
         python-pyenchant
         webkit2gtk)
makedepends=(python-setuptools)
optdepends=("texlive-core: Export as PDF files"
            "otf-fira-mono: Recommended font (OTF)"
            "ttf-fira-mono: Recommended font (TTF)")
provides=(uberwriter)
conflicts=(uberwriter)
source=("git+https://github.com/UberWriter/uberwriter.git"
        "uberwriter.patch")
sha256sums=(SKIP
            SKIP)

pkgver() {
    cd uberwriter
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd uberwriter
    patch -Np1 -i "${srcdir}/uberwriter.patch"
}

build() {
    cd uberwriter
    python setup.py build
}

package() {
    cd uberwriter
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
