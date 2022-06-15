# Maintainer: Joshua Haase <hahj87@gmail.com>
pkgname=manubot
pkgver=0.5.3
pkgrel=1
pkgdesc="a set of tools for the next generation of scholarly publishing."
arch=('any')
url="https://manubot.org/"
license=('BSD2-patent')
_pydeps=(
  'errorhandler'
  'isbnlib'
  'jinja'
  'jsonschema'
  'panflute'
  'pybase62'
  'pyaml'
  'ratelimiter'
  'requests'
  'requests-cache'
  'toml'
)
depends=("${_pydeps[@]/#/python-}" pandoc)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}::git+https://github.com/manubot/manubot#tag=v${pkgver}")
md5sums=('SKIP')
validpgpkeys=('4AEE18F83AFDEB23')

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	pytest
}

package() {
	cd "$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
