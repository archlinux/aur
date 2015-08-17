# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=2.2.12
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
changelog=auto-changelog.txt
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b1374399c81c1db5319606000a0be990767c221f7b369c06f72d50ce779dbbfe')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    # Install changelog
    echo "${pkgver}-${pkgrel}:" > ${startdir}/auto-changelog.txt
    sed -n '1h; 1!H; ${ g; s|.*<h3>Changes:</h3>\s\+<ul>\n\(.*\)\n\s\+</ul>.*|\1|; s|[\t ]\+<li>\([^\n]*\)</li>|\1|g p }' webservice/index.html >> ${startdir}/auto-changelog.txt
}
