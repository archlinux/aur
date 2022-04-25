# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=translate-toolkit
pkgname=${_pkgname}-git
pkgver=3.6.1.1.g4a8003f4
pkgrel=1
pkgdesc="A set of software and documentation designed to help make the lives of localizers both more productive and less frustrating"
arch=('any')
url=https://toolkit.translatehouse.org/
license=('GPL')
depends=('python-lxml')
optdepends=("aeidon: handle subtitle files"
            "python-beautifulsoup4: handle Trados text files"
            "python-charset-normalizer: charset detection"
            "python-cheroot: tmserver (service to query Translation Memory via HTTP)"
            "python-fluent.syntax: Fluent localization system"
            "python-iniparse: ini2po and po2ini (conversion of *.ini to Gettext PO files and vice versa)"
            "python-pycountry: translate language names"
            "python-pyenchant: spellcheck"
            "python-pyparsing: handle .rc files"
            "python-levenshtein: improve performance for fuzzy matching"
            "python-ruamel-yaml: YAML support"
            "python-vobject: convert iCalendar files")
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/translate/translate.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname%-toolkit}
  git describe --always | sed 's/-/./g'
}

build() {
  cd ${_pkgname%-toolkit}
  python setup.py build
}

package() {
  cd ${_pkgname%-toolkit}
  python setup.py install --root "${pkgdir}"
}
