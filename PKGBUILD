# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=aircall
pkgver=0.0.4
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Aircall, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/aircall.git"
electron_version='electron@v7.1.0'
license=('MIT')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
appname="${pkgname%-git}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%}::git+${url}#branch=master")

sha256sums=('SKIP')

build() {
  npm install --prefix $srcdir/${pkgname}
  cd "$srcdir/${pkgname}"
  npm run dist
  cd dist
  ar x `ls -1 ${appname}*.deb|head -n 1`
  tar xJf data.tar.xz
  sed -i 's/Name=aircall/Name=Aircall/' ${srcdir}/${pkgname}/dist/usr/share/applications/aircall.desktop


}

package() {
    mv "${srcdir}/${pkgname}/dist/usr" "${pkgdir}/usr"
    mv "${srcdir}/${pkgname}/dist/opt" "${pkgdir}/opt"
}

