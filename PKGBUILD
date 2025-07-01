# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: gigas002 <gigas002@pm.me>

pkgname=carbonyl
pkgver=0.0.3
pkgrel=2
pkgdesc="Chromium-based browser built to run in a terminal"
arch=('x86_64')
url="https://github.com/fathyb/carbonyl"
license=('BSD')
options=(!strip)
depends=(nss alsa-lib expat nspr glibc gcc-libs)
makedepends=(npm)
source=(v"${pkgver}.tar.gz::https://github.com/fathyb/carbonyl/archive/v$pkgver.tar.gz"
        "${pkgname}.sh")
sha256sums=('bf421b9498a084a7cf2238a574d37d31b498d3e271fdb3dcf466e7ed6c80013d'
            '07d6361edfa45d58a2d81e527f1a976fef9ba5417daa0ff8b4acfdfc95f8032e')

build() {
  cd "$pkgname-$pkgver"
  npm install --cache "${srcdir}/npm-cache" $pkgname
}


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}/"
    mv ${srcdir}/${pkgname}-${pkgver}/node_modules/@fathyb/carbonyl-linux-amd64/build/* ${pkgdir}/opt/${pkgname}
    cd ..
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
