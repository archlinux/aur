# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=imagemagick-full-doc-git
pkgver=7.0.7.0.r12468.g2f8ac2203
pkgrel=1
pkgdesc='The ImageMagick documentation (utilities manuals and libraries API)'
arch=('any')
url='http://www.imagemagick.org/'
license=('custom')
makedepends=('git')
provides=('imagemagick-doc' 'imagemagick-full-doc' 'imagemagick-git-doc')
conflicts=('imagemagick-doc' 'imagemagick-full-doc' 'imagemagick-git-doc')
source=("$pkgname"::'git+https://github.com/ImageMagick/ImageMagick.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    local _version="$(grep 'PACKAGE_VERSION=' version.sh | sed 's/[^0-9\.]*//g')"
    local _release="$(grep 'PACKAGE_RELEASE=' version.sh | sed 's/[^0-9]*//g')"
    local _revision="$(printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
    
    printf '%s.%s.%s' "$_version" "$_release" "$_revision"
}

build() {
    cd "$pkgname"
    ./configure --prefix='/usr'
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install-data-html
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
