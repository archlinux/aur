# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
_pkgname=convey
pkgname=python-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="CSV processing and mutual conversion of web related data types"
arch=('any')
url="https://github.com/CZ-NIC/${_pkgname}"
license=('GPL3')
depends=(
  'python'
  'python-pint'
  'python-chardet'
  'python-dateutil'
  'python-requests'
  'python-netaddr'
  'python-jsonpickle'
  'python-ipdb'
  'python-pythondialog'
  'python-validate-email'
  'python-tabulate'
  'python-appdirs'
  'python-humanize'
  'python-beautifulsoup4'
  'python-levenshtein'
  'python-prompt_toolkit'
  'python-pygments'
)
optdepends=(
  'bind-tools: DNS information gathering with dig',
  'nmap: port scanning',
  'xdg-utils: opening default apps using xdg-open',
  'whois: querying WHOIS information'
)
source=("https://github.com/CZ-NIC/${_pkgname}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '0001-requirements.txt-use-correct-beautifulsoup4-package-.patch')
sha256sums=('c9350ab35fba4b75355181a48cdef6459e6a4269caa817783bcb2630e83e1158'
            'a9250e5aec87e7fc6e69bb6d0054fdd93476eccaf0dd8f0ec394e9755093285a')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-requirements.txt-use-correct-beautifulsoup4-package-.patch"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
