# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

_basename="deprecation-detector"
_tag="0.1.0-alpha2"
pkgname="php-${_basename}"
pkgver=${_tag/\-/\.}
pkgrel=1
pkgdesc="static code analyzer for your project's source code to find usages of deprecated methods, classes and interfaces"
url="https://github.com/sensiolabs-de/deprecation-detector"
license="MIT"
arch=("any")
depends=("php>=5.3.9")
makedepends=("php-box" "php-composer" "git")
source=("git+https://github.com/sensiolabs-de/deprecation-detector.git#tag=${_tag}")
sha256sums=("SKIP")

build() {
  cd "${srcdir}/${_basename}"

  composer install --prefer-dist --no-dev
  php-box build
}

package() {
  cd "${srcdir}/${_basename}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_basename}.phar" "${pkgdir}/usr/share/webapps/bin/${_basename}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_basename}.phar" "${pkgdir}/usr/bin/${_basename}"
}
