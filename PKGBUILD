# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-git
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
conflicts=('google-chat-linux-electron7-git')
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
}

package() {
    mv "${srcdir}/${pkgname}/dist/usr" "${pkgdir}/usr"
    mv "${srcdir}/${pkgname}/dist/opt" "${pkgdir}/opt"
}

