# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=igv-web
_pkgname=igv
pkgver=2.2.8
pkgrel=1
pkgdesc='A web application for exploring genomic datasets using igv.js'
arch=('x86_64' 'aarch64')

url='https://igv.org/doc/webapp/'
license=('MIT')
keywords=('bioinformatics')
depends=('nginx')
makedepends=('npm')

source=("https://igv.org/app-archive/igv-webapp.${pkgver}.zip"
"igv-web.patch"
)
sha256sums=('SKIP'
'SKIP'
)
options=('!strip')

prepare() {
patch igv-webapp.${pkgver}/index.html -i ${pkgname}.patch
}

build() {
cd igv-webapp.${pkgver}
npm install bootstrap@5.3.3
npm install jquery@3.5.1
npm install react-dom@16.14.0
npm install @jbrowse/react-circular-genome-view@1.7
}

package() {
#install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/modules.d/${pkgname}.conf
install -dm644 ${pkgdir}/srv/http
cp -r ${srcdir}/igv-webapp.${pkgver} ${pkgdir}/srv/http/${pkgname}
}
