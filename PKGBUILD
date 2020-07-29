# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: James Zhu <james.zhu.engineer@gmail.com>

_gitname=FiraCode
pkgname=otf-fira-code-git
pkgver=5.2.r5.g64c21a4
pkgrel=1
pkgdesc="Monospaced font with programming ligatures"
arch=('any')
url="https://github.com/tonsky/$_gitname"
license=('OFL')
_py_deps=('fontmake'
          'idna'
          'pillow'
          'requests'
          'urllib3')
makedepends=('ttfautohint'
             'woff2'
             'gftools'
             'git'
             'sfnt2woff-zopfli')
makedepends+=("${_py_deps[@]/#/python-}")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"
    ./script/build
}

package() {
	cd "$_gitname"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" distr/otf/$_gitname-*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
