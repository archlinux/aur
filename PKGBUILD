# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
# Contributor: fabioticconi <fabio dot ticconi at gmail dot com>

pkgname=weidu-bin
pkgver=238
pkgrel=1
pkgdesc="A dialogue compiler for Infinity Engine games (precompiled binary)"
arch=('i686' 'x86_64')
url="http://weidu.org"
license=('GPL2')
source=(http://www.weidu.org/~thebigg/WeiDU-Linux-$pkgver.zip)
md5sums=('af186def723bd4cc5f8f6fb2cd8b0c98')
options=('!strip')

package() {
  if [ ${CARCH} == 'x86_64' ]; then
    cd "${srcdir}/WeiDU-Linux/bin/amd64"
  else
    cd "${srcdir}/WeiDU-Linux/bin/i386"
  fi

  install -D -m755 ./mosunpack "${pkgdir}/usr/bin/mosunpack"
  install -D -m755 ./mospack "${pkgdir}/usr/bin/mospack"
  install -D -m755 ./tisunpack "${pkgdir}/usr/bin/tisunpack"
  install -D -m755 ./tispack "${pkgdir}/usr/bin/tispack"
  install -D -m755 ./tolower "${pkgdir}/usr/bin/tolower"
  install -D -m755 ./weidu "${pkgdir}/usr/bin/weidu"
  install -D -m755 ./weinstall "${pkgdir}/usr/bin/weinstall"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  cd "$srcdir/WeiDU-Linux"

  # copy the examples directory
  cp -R ./examples "${pkgdir}/usr/share/doc/${pkgname}"
  # copy the lib directory
  cp -R ./lib "${pkgdir}/usr/share/${pkgname}"

  # set files to 644 and directories to 755,
  # for both the "examples" and "lib" directories
  cd "${pkgdir}/usr/share/doc/${pkgname}"
  chmod 664 ./examples -R
  find ./examples -type d -print0 | xargs -0 chmod 755

  cd "${pkgdir}/usr/share/${pkgname}"
  chmod 664 ./lib -R
  find ./lib -type d -print0 | xargs -0 chmod 755

  cd "${srcdir}/WeiDU-Linux"

  # copy the readmes
  install -D -m644 ./readme-mosunpack.txt "${pkgdir}/usr/share/doc/${pkgname}/readme-mosunpack.txt"
  install -D -m644 ./readme-tisunpack.txt "${pkgdir}/usr/share/doc/${pkgname}/readme-tisunpack.txt"
  install -D -m644 ./README-WeiDU-Changes.txt "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU-Changes.txt"
  install -D -m644 ./README-WeiDU.html "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU.html"
}
