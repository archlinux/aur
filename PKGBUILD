# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=structurizr
pkgver=6.0.0
pkgrel=1
pkgdesc="Software architecture models as code"
arch=('any')
url="https://structurizr.com/"
license=('Apache-2.0')
depends=('java-runtime')
makedepends=('git' 'maven')
conflicts=('structurizr-git')
options=('!strip')
source=("git+https://github.com/structurizr/structurizr.git#tag=v$pkgver"
	"structurizr.sh")
sha256sums=('SKIP'
            'becf35524c25e66b76a21f206b813b97afa6a223d3de61f4b202248957b250d4')

build() {
    cd structurizr
    mvn -DexcludedGroups=IntegrationTest package
}

package() {
    cd structurizr
    install -D -m644 -t "$pkgdir/usr/share/java/${pkgname}" structurizr-application/target/structurizr-*.war
    mkdir -p "$pkgdir/usr/share/${pkgname}"
    cp -a structurizr-themes "$pkgdir/usr/share/${pkgname}/themes"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "$pkgdir/usr/bin"
    sed -e "s|/structurizr/|/${pkgname}/|g" "$srcdir/structurizr.sh" > "$pkgdir/usr/bin/structurizr"
    chmod 755 "$pkgdir/usr/bin/structurizr"
}
