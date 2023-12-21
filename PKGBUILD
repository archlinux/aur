# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname='python2-beautifulsoup4'
_distname="${pkgname#python2-}"
pkgver=4.9.3
pkgrel=7
pkgdesc='Web HTML/XML parser addons for screen-scraping (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_distname}/${pkgver}/"
license=('MIT')
depends=('python2-soupsieve')
optdepends=(
    'python2-chardet: to autodetect character encodings'
    'python2-html5lib: alternative HTML parser'
)
makedepends=(
    'python2-setuptools'
)
_tarname="${_distname}-${pkgver}"
source=(
  "https://files.pythonhosted.org/packages/source/${_distname::1}/${_distname}/${_tarname}.tar.gz")
sha256sums=(
  '84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25')

_sourcedirectory="$_distname-$pkgver"

build() {
  cd \
    "${_tarname}"
  python2 \
    setup.py \
    build
}

check() {
  cd \
    "${_tarname}"
  python2 \
    -m unittest \
      discover \
        -s bs4 \
	-v
}

package() {
  cd \
    "${_tarname}"
  python2 \
    setup.py \
      install \
      --root="${pkgdir}" \
      --optimize=1 \
      --skip-build
  
  install \
    -Dm 644 \
    'LICENSE' \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ft=sh syn=sh et
